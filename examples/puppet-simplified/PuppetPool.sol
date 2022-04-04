// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
}

interface IUniswapModel {
    function getDVTBalance(uint256) external view returns (uint256);
    function getETHBalance(uint256) external view returns (uint256);
}

contract PuppetPool {

    mapping(address => uint256) public deposits;
    address public uniswapAddress;
    IERC20 public dvtPool;
    IERC20 public ethPool;
    IUniswapModel public uniswap;
    
    constructor () {}

    function setPoolAddresses(address ethAddress, address dvtAddress, address uAddr) external {
        dvtPool = IERC20(dvtAddress);
        ethPool = IERC20(ethAddress);
        uniswap = IUniswapModel(uAddr);
        uniswapAddress = uAddr;
    }

    // Allows borrowing `borrowAmount` of tokens by first depositing two times their value in ETH
    function borrow(uint256 borrowAmount, uint256 depositAmount) public payable {
        // simulate side effects
        ethPool.transferFrom(msg.sender, address(this), depositAmount);

        uint256 depositRequired = calculateDepositRequired(borrowAmount);
        
        require(depositAmount >= depositRequired);
        
        if (depositAmount > depositRequired) {
            ethPool.transfer(msg.sender, depositAmount - depositRequired);
        }

        deposits[msg.sender] = deposits[msg.sender] + depositRequired;

        // Fails if the pool doesn't have enough tokens in liquidity
        require(dvtPool.transfer(msg.sender, borrowAmount));
    }

    function calculateDepositRequired(uint256 amount) public view returns (uint256) {
        return amount * _computeOraclePrice() * 2 / 10;
    }

    function _computeOraclePrice() private view returns (uint256) {
        // calculates the price of the token in wei according to Uniswap pair
        return uniswap.getETHBalance(0) / dvtPool.balanceOf(uniswapAddress);
    }

    function eurus_oracle_price(uint256) view external returns (uint256) {
        // calculates the price of the token in wei according to Uniswap pair
        return uniswap.getETHBalance(0) / dvtPool.balanceOf(uniswapAddress);
    }

    function eurus_deposit_required(uint256 amount) view external returns (uint256) {
        return amount * _computeOraclePrice() * 2 / 10;
    }

    function eurus_dep0() view external returns (uint256) {
        return _computeOraclePrice() ;
    }

    function eurus_dep1(uint256 amount) view external returns (uint256) {
        return amount * _computeOraclePrice() ;
    }

}
