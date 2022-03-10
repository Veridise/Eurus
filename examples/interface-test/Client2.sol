// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IServer {
    function addition(uint256,uint256) external returns (uint256);
}

contract Client2 {

    address server_address;
    uint256 other_value;

    constructor(address _server_address, uint256 _other_value) {
        server_address = _server_address;
        other_value = _other_value;
    }
    
    function call_addition(uint256 a, uint256 b) public returns (uint256) {
        return IServer(server_address).addition(a,b);
    }

}