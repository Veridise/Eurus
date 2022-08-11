// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import {ERC20} from "./ERC20.sol";
import {UniswapModel} from "./UniswapModel.sol";

contract PuppetPool {

    mapping(address => uint256) public deposits;
    address public uniswapAddress;
    ERC20 public dvtPool;
    ERC20 public ethPool;
    UniswapModel public uniswap;

    constructor () {}

    function setPoolAddresses(address ethAddress, address dvtAddress, address uAddr) external {
        dvtPool = ERC20(dvtAddress);
        ethPool = ERC20(ethAddress);
        uniswap = UniswapModel(uAddr);
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
        unchecked { return amount * _computeOraclePrice() * 2 / 10; }
    }

    function _computeOraclePrice() private view returns (uint256) {
        // calculates the price of the token in wei according to Uniswap pair
        unchecked { return uniswap.getETHBalance(0) / dvtPool.balanceOf(uniswapAddress); }
    }

    function eurus_oracle_price(uint256) view external returns (uint256) {
        // calculates the price of the token in wei according to Uniswap pair
        unchecked { return uniswap.getETHBalance(0) / dvtPool.balanceOf(uniswapAddress); }
    }

    function eurus_deposit_required(uint256 amount) view external returns (uint256) {
        unchecked { return amount * _computeOraclePrice() * 2 / 10; }
    }

    function eurus_dep0() view external returns (uint256) {
        return _computeOraclePrice() ;
    }

    function eurus_dep1(uint256 amount) view external returns (uint256) {
        return amount * _computeOraclePrice() ;
    }

}
