// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IAddition {
    function addition(uint256, uint256) external pure returns (uint256);
}

contract YulCompilerTest3 {

    uint256 public var0;

    constructor(uint256 para0) {
        var0 = para0;
    }
    
    function addition(address addr, uint256 a, uint256 b) public pure returns (uint256) {
        return IAddition(addr).addition(a,b);
    }

}