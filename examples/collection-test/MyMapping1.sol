// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyMapping1 {

    mapping(address => uint256) public balances;

    constructor() {
        balances[address(9)] = 889;
    }
    
    function fetch(address a) public view returns (uint256) {
        return balances[a];
    }

}