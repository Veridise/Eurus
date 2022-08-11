<div align="left">
  <h1>
    <img src="./resources/eurus-white.png" width=50>
  	Eurus - YUL Symbolic Virtual Machine
  </h1>
</div>

This is a development README.

There's a documentation/tutorial built by sphinx. You can access it [here](https://sites.cs.ucsb.edu/~yanju/misc/eurus/) or build it locally by yourself.

Eurus is an edge version of [Venti@965703b](https://github.com/chyanju/Venti/tree/965703b370de796abd127be2a4c2cb5533eac296), specialized for DeFi applications.

## Building from Docker

```bash
docker build -t eurus:v0 .
docker run -it --rm eurus:v0 bash
```

## Building from Source

- Python (3.6+, Anaconda3 is highly recommended; otherwise you may be missing some packages)
  - Set alias of `python` in your environment to `python3`
  - pysha3: [https://github.com/tiran/pysha3](https://github.com/tiran/pysha3)
    - `pip install pysha3==1.0.2`
    - This is temporarily required for supporting keccak-256 hashing/computation.
  - eth-abi: [https://github.com/ethereum/eth-abi](https://github.com/ethereum/eth-abi)
    - `pip install eth_abi==2.1.1`
    - This is for easy abi encoding.

- Racket (8.0+): [https://racket-lang.org/](https://racket-lang.org/)
  - Rosette (4.0+): [https://github.com/emina/rosette](https://github.com/emina/rosette)
    - `raco pkg install rosette`
  - `bv` package (for running racket version of interpreter): [https://github.com/pmatos/racket-bv](https://github.com/pmatos/racket-bv)
    - `raco pkg install bv`
  - `sha` package
    - `raco pkg install sha`
- Solidity/Solc (0.8.14+ required; older versions have known Yul support issues): [https://soliditylang.org/](https://soliditylang.org/)
  - `solc-select` is recommended: [https://github.com/crytic/solc-select](https://github.com/crytic/solc-select)
- Antlr (4.8 required, not compatible with other versions): https://github.com/antlr/antlr4
  - Python Targets Setup: https://github.com/antlr/antlr4/blob/master/doc/python-target.md
  - `pip install antlr4-python3-runtime==4.8`
  - You also need antlr backend, for Ubuntu, run `sudo apt-get install antlr4`; for other systems, please check the Antlr homepage: [https://www.antlr.org/](https://www.antlr.org/)
- CVC4: [https://cvc4.github.io/](https://cvc4.github.io/)
  - Required for some tests.


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
  cd ./utils/YulAntlr/
  antlr4 -Dlanguage=Python3 Yul.g4
  ```

- Compile a solidity source code into Yul:

  ```bash
  # ex (examples)
  solc ./examples/ex/ex.sol --ir --overwrite -o ./examples/ex
  # harness
  cd ./examples/harness
  solc ./Harness.sol --ir --overwrite -o ./
  solc ./ERC20.sol --ir --overwrite -o ./
  # jury
  cd ./examples/jury
  solc ./Airdrop.sol --ir --overwrite -o ./
  ```
  
- Translate original Yul to Eurus Yul:

  ```bash
  # examples
  python ./utils/yul_translator.py --yul ./examples/ex/ex0.yul
  python ./utils/yul_translator.py --yul ./examples/ex/ex1.yul
  python ./utils/yul_translator.py --yul ./examples/ex/ex2.yul
  python ./utils/yul_translator.py --yul ./examples/ex/ex3.yul
  # harness
  python ./utils/yul_translator.py --yul ./examples/harness/Harness.yul
  python ./utils/yul_translator.py --yul ./examples/harness/ERC20.yul
  # jury
  python ./utils/yul_translator.py --yul ./examples/jury/Airdrop.yul
  ```
  
- Pre-process the Yul code and generated parsed json and config:

  ```bash
  # examples
  python ./utils/yul_parser.py --yul ./examples/ex/ex0.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/ex/ex1.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/ex/ex2.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/ex/ex3.eurus.yul
  # harness
  python ./utils/yul_parser.py --yul ./examples/harness/Harness.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/harness/ERC20.eurus.yul
  # jury
  python ./utils/yul_parser.py --yul ./examples/jury/Airdrop.eurus.yul
  ```

- run test script

  ```bash
  racket -l errortrace -t ./test-parallel0.rkt
  ```

## Other Commands

- External ABI Encoding

  ```bash
  python ./utils/abiencode.py "['string'],['abcd']"
  ```

- External ABI Decoding

  ```bash
  python ./utils/abidecode.py "['string'],b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x06\x6d\x79\x6e\x61\x6d\x65\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'"
  ```

- External Keccak256

  ```bash
  python ./utils/keccak256.py "fun(uint256,bool)"
  ```

## Notes & Resources

- Compile Sphinx documentations: `make clean html`
- Replace all `pragma` versions
  - Linux: `grep -Irl oldtext . | xargs sed -i 's/oldtext/newtext/g'`
  - Mac: `grep -Irl 0.8.10 . | xargs sed -i "" -e 's/0.8.10/0.8.13/g'`
- Default Addresses
  - "attacker": `0x97154a62cd5641a577e092d2eee7e39fcb3333dc`
  - "admin": `0xf23ec0bb4210edd5cba85afd05127efcd2fc6a78`
  - others are computed via [https://emn178.github.io/online-tools/keccak_256.html](https://emn178.github.io/online-tools/keccak_256.html) with name and take the first 40 characters (20bytes out of 32bytes, or 160bits out of 256bits).
- See [Notes & Resources](./NOTES.md) for details.
- [https://emn178.github.io/online-tools/keccak_256.html](https://emn178.github.io/online-tools/keccak_256.html)
- [https://ethsum.netlify.app/](https://ethsum.netlify.app/)

## Known Issues & TODOs

- Library address issue / `linkersymbol`.
- Consider changing some `bitvector->integer` to `bitvector->natural`.
