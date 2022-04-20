// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./YulCompilerTest2a.sol";

contract HelperContract {
    constructor(){}

    function addition(uint256 a, uint256 b) public pure returns (uint256) {
        return a+b;
    }
}

contract YulCompilerTest4 {

    uint256 public var0;
    HelperContract public helper;

    constructor(uint256 para0) {
        var0 = para0;
        helper = new HelperContract();
    }
    
    function addition(uint256 a, uint256 b) public view returns (uint256) {
        return helper.addition(a,b);
    }

}