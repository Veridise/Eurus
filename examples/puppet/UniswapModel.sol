// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import {ERC20} from "./ERC20.sol";

contract UniswapModel {

    ERC20 public dvtPool;
    ERC20 public ethPool;

    constructor () {}

    function setPoolAddresses(address dvtAddress, address ethAddress) external {
        dvtPool = ERC20(dvtAddress);
        ethPool = ERC20(ethAddress);
    }

    function getDVTBalance(uint256) external view returns (uint256) {
        return dvtPool.balanceOf(address(this));
    }

    function getETHBalance(uint256) external view returns (uint256) {
        return ethPool.balanceOf(address(this));
    }

    // greatly simplified
    function swapDVT4ETH(uint256 pad, uint256 v) external returns (uint256) {
        // provide DVT, get ETH
        // compute
        uint256 DVTBalance = dvtPool.balanceOf(address(this));
        uint256 ETHBalance = ethPool.balanceOf(address(this));
        require(ethPool.balanceOf(msg.sender)>=v, "not enough eth balance");
        uint256 k = DVTBalance * ETHBalance;
        uint256 newDVT = DVTBalance + v;
        uint256 newETH = k / newDVT;
        uint256 s = ETHBalance - newETH;
        // update
        ethPool.transferFrom(address(this), address(msg.sender), s);
        dvtPool.transferFrom(address(msg.sender), address(this), v);
        // return
        return s;
    }

}