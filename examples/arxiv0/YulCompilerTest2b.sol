// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./YulCompilerTest2a.sol";

contract YulCompilerTest2b {

    uint256 public var0;

    constructor(uint256 para0) {
        var0 = para0;
    }
    
    function addition(address addr, uint256 a, uint256 b) public pure returns (uint256) {
        return YulCompilerTest2a(addr).addition(a,b);
    }

}