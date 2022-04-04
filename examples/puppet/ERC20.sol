// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ERC20 {

    mapping(address => uint256) public balances;

    constructor() {}

    function transferFrom(address from, address to, uint256 amount) external returns (bool) {
        // can change to require in next revisions
        if (balances[from]<amount) {
            return false;
        } else {
            balances[from] = balances[from] - amount;
            balances[to] = balances[to] + amount;
            return true;
        }
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        address from = msg.sender;
        // can change to require in next revisions
        if (balances[from]<amount) {
            return false;
        } else {
            balances[from] = balances[from] - amount;
            balances[to] = balances[to] + amount;
            return true;
        }
    }

    // only for admin use
    function eurus_set_balances(address addr, uint256 amount) external {
        balances[addr] = amount;
    }

}
