// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IServer {
    function addition(uint256,uint256) external returns (uint256);
}

contract Client {

    address server_address;

    constructor(address _server_address) {
        server_address = _server_address;
    }
    
    function call_addition(uint256 a, uint256 b) public returns (uint256) {
        return IServer(server_address).addition(a,b);
    }

}