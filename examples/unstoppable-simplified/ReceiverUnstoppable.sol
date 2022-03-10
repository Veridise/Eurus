// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface ILender {
    function depositTokens(uint256 amount) external;
    function flashLoan(uint256 borrowAmount) external;
}

interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
}

contract ReceiverUnstoppable {

    ILender private pool;
    address private owner;

    constructor(address poolAddress) {
        pool = ILender(poolAddress);
        owner = msg.sender;
    }

    // Pool will call this function during the flash loan
    function receiveTokens(address tokenAddress, uint256 amount) external {
        require(msg.sender == address(pool), "Sender must be pool");
        // Return all tokens to the pool
        require(IERC20(tokenAddress).transfer(msg.sender, amount), "Transfer of tokens failed");
    }

    function executeFlashLoan(uint256 amount) external {
        require(msg.sender == owner, "Only owner can execute flash loan");
        pool.flashLoan(amount);
    }
}