// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
}

contract UniswapModel {

	IERC20 public dvtPool;
	IERC20 public ethPool;

	constructor () {}

	function setPoolAddresses(address dvtAddress, address ethAddress) external {
		dvtPool = IERC20(dvtAddress);
		ethPool = IERC20(ethAddress);
	}

	function getDVTBalance(uint256) external view returns (uint256) {
		return dvtPool.balanceOf(address(this));
	}

	function getETHBalance(uint256) external view returns (uint256) {
		return ethPool.balanceOf(address(this));
	}

	// greatly simplified
	function swapDVT4ETH(uint256 v) external {
		// provide DVT, get ETH
		// compute
		uint256 DVTBalance = dvtPool.balanceOf(address(this));
		uint256 ETHBalance = ethPool.balanceOf(address(this));
		uint256 k = DVTBalance * ETHBalance;
		uint256 newDVT = DVTBalance + v;
		uint256 newETH = k / newDVT;
		uint256 s = ETHBalance - newETH;
		// update
		ethPool.transferFrom(address(this), address(msg.sender), s);
		dvtPool.transferFrom(address(msg.sender), address(this), v);
	}

}