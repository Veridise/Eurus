// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface MathLib {
    function addition(uint256 a, uint256 b) external pure returns (uint256);
}

contract YulInterfaeTest0 {

    uint256 public var0;

    constructor(uint256 para0) {
        var0 = para0;
    }
    
    function addition(uint256 a, uint256 b, address c) external pure returns (uint256) {
        return MathLib(c).addition(a,b);
    }

}