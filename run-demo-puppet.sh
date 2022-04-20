#!/bin/bash

# compile to YUL
solc ./examples/puppet-simplified/PuppetPool.sol --ir --overwrite -o ./examples/puppet-simplified
solc ./examples/puppet-simplified/ERC20.sol --ir --overwrite -o ./examples/puppet-simplified
solc ./examples/puppet-simplified/UniswapModel.sol --ir --overwrite -o ./examples/puppet-simplified

# enhance YUL
python ./utils/yul_translator.py --yul ./examples/puppet-simplified/PuppetPool.yul
python ./utils/yul_translator.py --yul ./examples/puppet-simplified/ERC20.yul
python ./utils/yul_translator.py --yul ./examples/puppet-simplified/UniswapModel.yul

# parse YUL
python ./utils/yul_parser.py --yul ./examples/puppet-simplified/PuppetPool.eurus.yul
python ./utils/yul_parser.py --yul ./examples/puppet-simplified/ERC20.eurus.yul
python ./utils/yul_parser.py --yul ./examples/puppet-simplified/UniswapModel.eurus.yul

racket ./demo-puppet.rkt