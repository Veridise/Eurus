// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

library exlib {
    function sub(uint256 a, uint256 b) public returns (uint256) {
        return a-b;
    }
}

// empty constructor
// basic function call
contract ex0 {
    constructor() {}
    function add(uint256 a, uint256 b) external pure returns (uint256) {
        return a+b;
    }
}

// constructor with arguments
contract ex1 {
    uint256 _base;
    constructor(uint256 base) {
        _base = base;
    }
    function add(uint256 a, uint256 b) external view returns (uint256) {
        return a+b+_base;
    }
    function getBase() external view returns (uint256) {
        return _base;
    }
}

// constructor with string arguments, like ERC20
contract ex2 {
    string public _name;
    string public _symbol;
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }
    function getName() public view returns (string memory) {
        return _name;
    }
    function getSymbol() public view returns (string memory) {
        return _symbol;
    }
}

// WETH9, yul will have something like add("WETH", 8), what is this?
contract ex3 {
    string public name = 'Wrapped Ether';
    string public symbol = 'WETH';
    uint8 public decimals = 18;
    constructor(){}
    function getName() public view returns (string memory) {
        return name;
    }
    function getDecimals() public view returns (uint8) {
        return decimals;
    }
    function doAdd(uint256 a, uint256 b) public pure returns (uint256) {
        return a+b;
    }
}

// test for basic EVM wallet functionality
// https://gist.github.com/CJ42/156f7fc884a2bbab30738f6e01d5f393#file-address-methods-md
// https://jeancvllr.medium.com/solidity-tutorial-all-about-addresses-ffcdf7efc4e7
// send, call, delegatecall, staticcall are currently not tested, will test later
contract ex4 {
    address _owner;

    constructor(address owner) {
        _owner = owner;
    }

    // call transfer on behalf of _owner
    // that is, send "value" from "_owner" to "to"
    function testTransfer(address to, uint256 value) public {
        payable(to).transfer(value);
    }

    function testBalance(address account) public view returns (uint256) {
        return account.balance;
    }

}

// testing the library / linkersymbol setup
contract ex5 {

    constructor() {}

    // delegate call to a library
    function sub(uint256 a, uint256 b) public returns (uint256) {
        return exlib.sub(a,b);
    }


}