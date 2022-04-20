# Eurus - Solver-Aided YUL Virtual Machine
This is a development README.

Eurus is an edge version of [Venti@965703b](https://github.com/chyanju/Venti/tree/965703b370de796abd127be2a4c2cb5533eac296), specialized for DeFi applications.

## Pre-Requisites

- pysha3 ([https://github.com/tiran/pysha3](https://github.com/tiran/pysha3))
  - `pip install pysha3`
  - This is temporarily required for supporting keccak-256 hashing/computation.
- racket's `sha` package
  - `raco pkg install sha`


## Quick-Start Guides

(coming soon)

## Python Yul Parser

This parses the Yul source code into json representation, and generates a helper configuration file which includes:

- mapping of call codes and function names (signatures)

```bash
usage: yul_parser.py [-h] [--yul YUL] [--verbose VERBOSE]

optional arguments:
  -h, --help         show this help message and exit
  --yul YUL          input yul file
  --verbose VERBOSE  show more info for debugging
```

It will automatically outputs `filename.json` and `filename.config.json` in the same folder.

## Useful Commands

- Automatically generate the core Yul parser:

  ```bash
  cd ./utils
  antlr4 -Dlanguage=Python3 Yul.g4
  ```

- Compile a solidity source code into Yul:

  ```bash
  solc ./examples/interface-test/Server.sol --ir --overwrite -o ./examples/interface-test
  solc ./examples/interface-test/Client.sol --ir --overwrite -o ./examples/interface-test
  solc ./examples/collection-test/MyMapping1.sol --ir --overwrite -o ./examples/collection-test
  solc ./examples/require-test/ReqTest1.sol --ir --overwrite -o ./examples/require-test
  
  # unstoppable
  solc ./examples/unstoppable-simplified/ReceiverUnstoppable.sol --ir --overwrite -o ./examples/unstoppable-simplified
  solc ./examples/unstoppable-simplified/UnstoppableLender.sol --ir --overwrite -o ./examples/unstoppable-simplified
  solc ./examples/unstoppable-simplified/ERC20.sol --ir --overwrite -o ./examples/unstoppable-simplified
  
  # puppet
  solc ./examples/puppet-simplified/PuppetPool.sol --ir --overwrite -o ./examples/puppet-simplified
  solc ./examples/puppet-simplified/ERC20.sol --ir --overwrite -o ./examples/puppet-simplified
  solc ./examples/puppet-simplified/UniswapModel.sol --ir --overwrite -o ./examples/puppet-simplified
  ```

- Translate original Yul to Eurus Yul:

  ```bash
  python ./utils/yul_translator.py --yul ./examples/interface-test/Server.yul
  python ./utils/yul_translator.py --yul ./examples/interface-test/Client.yul
  python ./utils/yul_translator.py --yul ./examples/collection-test/MyMapping1.yul
  python ./utils/yul_translator.py --yul ./examples/require-test/ReqTest1.yul
  
  # unstoppable
  python ./utils/yul_translator.py --yul ./examples/unstoppable-simplified/ReceiverUnstoppable.yul
  python ./utils/yul_translator.py --yul ./examples/unstoppable-simplified/UnstoppableLender.yul
  python ./utils/yul_translator.py --yul ./examples/unstoppable-simplified/ERC20.yul
  
  # puppet
  python ./utils/yul_translator.py --yul ./examples/puppet-simplified/PuppetPool.yul
  python ./utils/yul_translator.py --yul ./examples/puppet-simplified/ERC20.yul
  python ./utils/yul_translator.py --yul ./examples/puppet-simplified/UniswapModel.yul
  ```

- Pre-process the Yul code and generated parsed json and config:

  ```bash
  python ./utils/yul_parser.py --yul ./examples/interface-test/Server.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/interface-test/Client.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/collection-test/MyMapping1.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/require-test/ReqTest1.eurus.yul
  
  # unstoppable
  python ./utils/yul_parser.py --yul ./examples/unstoppable-simplified/ReceiverUnstoppable.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/unstoppable-simplified/UnstoppableLender.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/unstoppable-simplified/ERC20.eurus.yul
  
  # puppet
  python ./utils/yul_parser.py --yul ./examples/puppet-simplified/PuppetPool.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/puppet-simplified/ERC20.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/puppet-simplified/UniswapModel.eurus.yul
  ```

## Notes & Resources

- See [Notes & Resources](./NOTES.md) for details.

## Known Issues & TODOs

- ▢ Dispatcher calling with empty argument may cause a `take` error with less than 32 elements. Need to check and fix. Currently a temporary fix is applied.
- ▢ You need a builtin ETH pool that handles builtin methods like `transfer` without a caller.
- ▢ The `zhash` has a bug when setting a `constant` as a key. See the lifting strategies in the notes for more details. A solution is provided and should be propagated to the `zhash` implementation. But practically, keys to `zhash` can only be those symbolic values that are decomposible to concrete values. In other words, e.g., `constant` can not be a key.
- ▢ Properly lift the memory management modules so that they provide APIs for symbolic memory access that works with `zhash`.
- ✓ Replace `destruct` back to `match` with corresponding lifting to have better control of symbolic states.
- ✓ Replace all `match` with `destruct`; before doing this, a Yul json should be parsed into structs, not pure lists.

