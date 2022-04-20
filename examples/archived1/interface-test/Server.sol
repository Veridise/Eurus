// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Server {
    constructor() {}

    function addition(uint256 a, uint256 b) external pure returns (uint256) {
        return a+b;
    }

}