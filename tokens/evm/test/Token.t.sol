// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {TOKEN} from "../src/Token.sol";

contract TokenTest is Test {
    TOKEN public token;
    address initialOwner;

    function setUp() public {
        initialOwner = address(1);
        token = new TOKEN(initialOwner);
    }

    function test_Owner() view public {
        assertEq(token.owner(), address(1));
    }
}