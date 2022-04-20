# Eurus - Precise Attack Synthesis for DeFi Apps
Eurus is an open-source general framework for smart contract verification and synthesis. Eurus performs reasoning using a builtin symbolic virtual machine based on the [YUL](https://docs.soliditylang.org/en/latest/yul.html) intermediate language from Solidity.

Eurus is still under active development. For development README please see [here](./DEV.md). For development notes and resources please see [here](./NOTES.md).

# Dependencies

- Python (3.6+)
  - pysha3: [https://github.com/tiran/pysha3](https://github.com/tiran/pysha3)
    - `pip install pysha3`
    - This is temporarily required for supporting keccak-256 hashing/computation.

- Racket (8.0+): [https://racket-lang.org/](https://racket-lang.org/)
  - Rosette (4.0+): [https://github.com/emina/rosette](https://github.com/emina/rosette)
    - `raco pkg install rosette`
  - `sha` package
    - `raco pkg install sha`
- Solidity/Solc (0.8.9 recommended): [https://soliditylang.org/](https://soliditylang.org/)
  - `solc-select` is recommended: [https://github.com/crytic/solc-select](https://github.com/crytic/solc-select)

- Antlr (4.8): https://github.com/antlr/antlr4
  - Python Targets Setup: https://github.com/antlr/antlr4/blob/master/doc/python-target.md
  - `pip install antlr4-python3-runtime`


# Quick-Start Guides

The following shows how you utilize Eurus to automatically synthesize an attack for an adapted DeFi benchmark [Puppet](https://www.damnvulnerabledefi.xyz/v1/challenges/8.html) from [Damn Vulnerable DeFi](https://www.damnvulnerabledefi.xyz/). The benchmark files can be found in `examples/puppet-simplified/`.

## Push-Button Quick Run

You can directly perform the attack synthesis using the following command since we've already included all the intermediate files in the repo:

```bash
racket ./demo-puppet.rkt
```

As an alternative, you can also directly run the following script for solving the benchmark (given that all dependencies are correctly configured) by regenerating all the intermediate files on your local machine again:

```bash
./run-demo-puppet.sh
```

The script wraps up all the detailed steps in the following section.

It will output the synthesized attack contract. Load it as `contracts/attacker-contracts/PuppetAttacker.sol` in the benchmarking framework (see [here](https://github.com/MrToph/damn-vulnerable-defi)) verify the hack.

## Detailed Steps

We show detailed steps and procedures for attacking on the example DeFi app.

First use `solc` to compile all contracts in the benchmarks into their YUL representations:

```bash
# compile to YUL
solc ./examples/puppet-simplified/PuppetPool.sol --ir --overwrite -o ./examples/puppet-simplified
solc ./examples/puppet-simplified/ERC20.sol --ir --overwrite -o ./examples/puppet-simplified
solc ./examples/puppet-simplified/UniswapModel.sol --ir --overwrite -o ./examples/puppet-simplified
```

And prepare the YUL files as inputs to Eurus:

```bash
# enhance YUL
python ./utils/yul_translator.py --yul ./examples/puppet-simplified/PuppetPool.yul
python ./utils/yul_translator.py --yul ./examples/puppet-simplified/ERC20.yul
python ./utils/yul_translator.py --yul ./examples/puppet-simplified/UniswapModel.yul

# parse YUL
python ./utils/yul_parser.py --yul ./examples/puppet-simplified/PuppetPool.eurus.yul
python ./utils/yul_parser.py --yul ./examples/puppet-simplified/ERC20.eurus.yul
python ./utils/yul_parser.py --yul ./examples/puppet-simplified/UniswapModel.eurus.yul
```

Then you can run to test the demo synthesis procedure:

```bash
racket ./demo-puppet.rkt
```

It will output the synthesized attack contract. Load it as `contracts/attacker-contracts/PuppetAttacker.sol` in the benchmarking framework (see [here](https://github.com/MrToph/damn-vulnerable-defi)) verify the hack.

