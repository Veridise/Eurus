// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC20.sol";

/**
 * @title DamnValuableToken
 * @author Damn Vulnerable DeFi (https://damnvulnerabledefi.xyz)
 */
contract DamnValuableToken is ERC20 {

    // Decimals are set to 18 by default in `ERC20`
    constructor() ERC20() {

    }
}