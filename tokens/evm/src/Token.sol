// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TOKEN is ERC20, ERC20Permit, Ownable {
    constructor(address initialOwner)
        ERC20("Test", "TST")
        ERC20Permit("Test")
        Ownable(initialOwner)
    {
        _mint(initialOwner, 42000000 * 10 ** decimals());
    }
}
