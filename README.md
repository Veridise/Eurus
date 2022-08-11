<div align="left">
  <h1>
    <img src="./resources/eurus-white.png" width=50>
  	Eurus - Precise Attack Synthesis for DeFi Apps
  </h1>
</div>

Eurus is an open-source general framework for smart contract verification and synthesis. Eurus performs reasoning using a builtin symbolic virtual machine based on the [YUL](https://docs.soliditylang.org/en/latest/yul.html) intermediate language from Solidity.

Eurus is still under active development. Please see different branches for history versions (e.g. demo version).

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

## Example Usage

There are two sets of examples in `examples/` showing how to use Eurus to perform concrete and symbolic execution with verification performed. The `ex/` corresponds to the concrete reasoning part of Eurus, and the `symex/` corresponds to the symbolic reasoning part. To run them, you'll need to first prepare them by running:

```bash
cd examples/
bash ./prepare-ex.sh
# or:
#   bash ./prepare-symex.sh
```

Then you can run different Eurus script to perform different tasks:

```bash
racket ./test-ex5.rkt
# or:
#   racket ./test-symex1.rkt
```

You can find out more details by reading `ex/ex.sol` and `symex/symex.sol`, as well as the `test-*.rkt` Eurus scripts. More documentations are on the way. For detailed steps, please see the "Other Commands" section.

## Other Commands

- Automatically generate the core Yul parser:

  ```bash
  cd ./utils/YulAntlr/
  antlr4 -Dlanguage=Python3 Yul.g4
  ```

- Compile a solidity source code into Yul:

  ```bash
  # ex (examples)
  solc ./examples/ex/ex.sol --ir --overwrite -o ./examples/ex
  ```

- Translate original Yul to Eurus Yul:

  ```bash
  # examples
  python ./utils/yul_translator.py --yul ./examples/ex/ex0.yul
  python ./utils/yul_translator.py --yul ./examples/ex/ex1.yul
  python ./utils/yul_translator.py --yul ./examples/ex/ex2.yul
  python ./utils/yul_translator.py --yul ./examples/ex/ex3.yul
  ```

- Pre-process the Yul code and generated parsed json and config:

  ```bash
  # examples
  python ./utils/yul_parser.py --yul ./examples/ex/ex0.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/ex/ex1.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/ex/ex2.eurus.yul
  python ./utils/yul_parser.py --yul ./examples/ex/ex3.eurus.yul
  ```

- run test script

  ```bash
  racket ./test-ex5.rkt
  ```

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