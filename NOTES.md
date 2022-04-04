# Eurus Notes and Resources

This collects helpful design notes for the system.

## Solidity/Yul/Rosette Detailed Implementation Notes

#### General Lifting Principles

- Only `do-interpret`, `call`, `do-user-call` and `do-builtin-call` contain codes for lifting.
  - Also `call-args-extraction` contains codes for lifting, which is a helper function for `*-call` series.
  - Also `builtin-function-book`.
- **Whoever processes a data structure lifts it.** That is, if you don't have to process a symbolic/decomposible data structure (say, you just pass it to another function), you don't have to lift it on your level. Just leave it to the function that actually processes it.
- **Whoever defines checks.**
  - `let`: usually check
  - `for/all`, `for*/all`: always check
  - `define`: usually check
    - after a variable declaration
    - inside a function definition
  - `match`: usually check
  - `cond`-`decomposible?`: always check

#### Notes for Lifting

- The `for/all` with `#:exhaustive` flag still ***cannot*** decompose a struct instance with symbolic member recursively.
- `symbolic?` is contagious: a concrete struct instance that has any symbolic member will be marked `#t` by the `symbolic?` procedure.
- Wrapping `for/all` on a `constant` symbolic value and `term`s with basic arithmetic operations rather than `ite` / `ite*` in a recursive call for lifting will result in infinite recursive ccalls, because nothing is to be decomposed.
- Eurus has a `decomposible?` method to guide whether a `for/all` should be wrapped on a symbolic value or not. The `decomposible?` method is only for stopping recursive call.
- Rosette overrides some of racket's original forms by throwing assertion error rather than contract violation when argument types don't match. For example, `+` throws assertion error in rosette, but throws contract violation in racket.

  - See the `tests/test-autolift.rkt` for some details.


#### Memory

```
0: 00000000 (1 byte)
1: 00000000 (1 byte)
```

#### Function Selector

Solidity uses only 4 bytes for hashing the function signature, even though `keccak256` returns 32 bytes.

```
"addition(uint256,uint256)"
==(bytes) 0x6164646974696f6e2875696e743235362c75696e7432353629
=apply=>(keccak256)
==(bytes32) 0x54f363a3ce7026055f02ed6a98b84adc1f6d1a1377ef244639ba368e53ca460b
==(bytes4) 0x54f363a3 ; truncated

"transfer(address,uint256)" => 0xa9059cbb
"transferFrom(address,address,uint256)" => 0x23b872dd
```

#### Call Data

See an example: [https://ethereum.stackexchange.com/questions/52989/what-is-calldata](https://ethereum.stackexchange.com/questions/52989/what-is-calldata)

#### Yul Constructor Argument Rewrite

See `utils/yul_translator.py: _t_rewrite_constructor_arguments`.

The original constructor call operates on EVM bytecode to fetch arguments (ABI encoded). While the bytecode is not available in Yul VM, we here rewrite related operations to directly operate on `callpack` struct.

```
function copy_arguments_for_constructor_23_object_Client_42() -> ret_param_0 {
            // let programSize := datasize("Client_42")
            // let argSize := sub(codesize(), programSize)

            // let memoryDataOffset := allocate_memory(argSize)
            // codecopy(memoryDataOffset, programSize, argSize)

            // rewrite by Eurus
            let argSize := sub(calldatasize(),4)
            let memoryDataOffset := allocate_memory(argSize)
            calldatacopy(memoryDataOffset,4,argSize)

            ret_param_0 := abi_decode_tuple_t_address_fromMemory(memoryDataOffset, add(memoryDataOffset, argSize))
        }
```

## Design Notes

- Use `yul_parser.py` to parse raw Yul code to json, and use `yul-parser.rkt` to parse json to racket structs.
- Due to the mysterious organization of compiled Yul code for a file containing multiple contracts, Eurus will assume that every file contains only one contract definition. For those application that requires multiple contracts, they are supposed to use `import` keyword to import other cotracts from other files, or `interface` keyword to only access APIs dynamically.
- Always remember that the current `ret` struct always has ***a list of return values*** (even for only one return), or `void`.
- The real `keccak256` function (in `utils/keccak256.py`) is used to encode function selector (usually for development and debugging). In the actual Yul virtual machine (in `eurus/yul-vm.rkt`), we use another racket implementation `sha256` instead because of a lot of reasons (e.g., making external calls using `process` doesn't support `null`/`\0` argument). This won't affect the hasing purpose of using the `keccak256` function.

## Racket Resources

- Racket Cheat Sheet: [https://docs.racket-lang.org/racket-cheat/index.html](https://docs.racket-lang.org/racket-cheat/index.html)
- Racket Byte Strings: [https://docs.racket-lang.org/reference/bytestrings.html](https://docs.racket-lang.org/reference/bytestrings.html)
- Converting Values to Strings: [https://docs.racket-lang.org/reference/strings.html#%28part._format%29](https://docs.racket-lang.org/reference/strings.html#%28part._format%29)
- macros: [https://www.greghendershott.com/fear-of-macros/all.html](https://www.greghendershott.com/fear-of-macros/all.html)
- Print more untruncated error info: `(error-print-width 1000000)`

## Solidity/Yul Resources

- Ethereum Development Documentation: [https://ethereum.org/en/developers/docs/](https://ethereum.org/en/developers/docs/)
  - Ethereum Virtual Machine (EVM): [https://ethereum.org/en/developers/docs/evm/](https://ethereum.org/en/developers/docs/evm/)
  - EVM Execution by Jello Paper: [https://jellopaper.org/evm/](https://jellopaper.org/evm/)
- Yul documentation: [https://docs.soliditylang.org/en/latest/yul.html](https://docs.soliditylang.org/en/latest/yul.html)
- Contract ABI Specification: [https://docs.soliditylang.org/en/develop/abi-spec.html](https://docs.soliditylang.org/en/develop/abi-spec.html)
  - Function Selector
  - Argument Encoding
- Function selector: [https://solidity-by-example.org/function-selector/](https://solidity-by-example.org/function-selector/)
- Keccak specifications: [https://keccak.team/keccak_specs_summary.html](https://keccak.team/keccak_specs_summary.html)
  - [https://github.com/emn178/js-sha3](https://github.com/emn178/js-sha3)
  - [https://github.com/tiran/pysha3](https://github.com/tiran/pysha3)
  - [https://github.com/ethereum/eth-utils](https://github.com/ethereum/eth-utils)
  - [https://github.com/ethereum/eth-hash](https://github.com/ethereum/eth-hash)
- Solidity by Example - Interface: [https://solidity-by-example.org/interface/](https://solidity-by-example.org/interface/)
- How does a constructor load inputs: [https://ethereum.stackexchange.com/questions/58866/how-does-a-contracts-constructor-work-and-load-input-values](https://ethereum.stackexchange.com/questions/58866/how-does-a-contracts-constructor-work-and-load-input-values)
  - [https://ethereum.stackexchange.com/questions/13008/how-are-the-arguments-of-the-constructor-encoded-in-the-contract-creation-transa](https://ethereum.stackexchange.com/questions/13008/how-are-the-arguments-of-the-constructor-encoded-in-the-contract-creation-transa)

## Other Resources

- zkSync 2.0: [https://blog.matter-labs.io/zksync-2-0-updates-1ae2b9bb9ff0](https://blog.matter-labs.io/zksync-2-0-updates-1ae2b9bb9ff0)