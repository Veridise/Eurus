// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IReceiver {
    function receiveTokens(address tokenAddress, uint256 amount) external;
}

interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
}

contract UnstoppableLender {

    IERC20 public damnValuableToken;
    uint256 public poolBalance;

    constructor(address tokenAddress) {
        require(tokenAddress != address(0), "Token address cannot be zero");
        damnValuableToken = IERC20(tokenAddress);
    }

    function depositTokens(uint256 amount) external {
        require(amount > 0, "Must deposit at least one token");
        // Transfer token from sender. Sender must have first approved them.
        damnValuableToken.transferFrom(msg.sender, address(this), amount);
        poolBalance = poolBalance + amount;
    }

    function flashLoan(uint256 borrowAmount) external {
        require(borrowAmount > 0, "Must borrow at least one token");

        uint256 balanceBefore = damnValuableToken.balanceOf(address(this));
        require(balanceBefore >= borrowAmount, "Not enough tokens in pool");

        // Ensured by the protocol via the `depositTokens` function
        assert(poolBalance == balanceBefore);
        
        // super simplified here, since calling `receiveTokens` will hold the execution
        // we skip it for now to only focus on exploiting the previous assertion
        // damnValuableToken.transfer(msg.sender, borrowAmount);
        
        // IReceiver(msg.sender).receiveTokens(address(damnValuableToken), borrowAmount);
        
        // uint256 balanceAfter = damnValuableToken.balanceOf(address(this));
        // require(balanceAfter >= balanceBefore, "Flash loan hasn't been paid back");
    }
}
