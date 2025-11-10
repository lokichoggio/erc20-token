// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Token} from "../src/Token.sol";
import {DeployToken} from "../script/Token.s.sol";

interface MintableToken {
    function mint(address, uint256) external;
}

contract TokenTest is Test {
    Token public token;
    DeployToken public deployer;

    address public deployerAddress;

    uint256 BOB_STARTING_AMOUNT = 100 ether;
    address bob;
    address alice;

    function setUp() public {
        deployer = new DeployToken();
        token = deployer.run();

        bob = makeAddr("bob");
        alice = makeAddr("alice");

        vm.prank(msg.sender);
        token.transfer(bob, BOB_STARTING_AMOUNT);
    }

    function testInitialSupply() public view {
        assertEq(token.totalSupply(), deployer.INITIAL_SUPPLY());
    }

    function testUsersCantMint() public {
        vm.expectRevert();
        MintableToken(address(token)).mint(address(this), 1);
    }

    function testAllowances() public {
        uint256 initialAllowance = 1000;

        // Bob approves Alice to spend tokens on his behalf

        vm.prank(bob);
        token.approve(alice, initialAllowance);
        uint256 transferAmount = 500;

        vm.prank(alice);
        token.transferFrom(bob, alice, transferAmount);
        assertEq(token.balanceOf(alice), transferAmount);
        assertEq(token.balanceOf(bob), BOB_STARTING_AMOUNT - transferAmount);
    }
}
