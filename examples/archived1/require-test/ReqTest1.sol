// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ReqTest1 {

    constructor() {}
    
    function require_gt1(uint256 a) public pure {
        require(a>1, "gt1 violation");
    }

    function assert_gt1(uint256 a) public pure {
        assert(a>1);
    }

}