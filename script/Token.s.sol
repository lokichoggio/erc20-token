// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Token} from "../src/Token.sol";

contract DeployToken is Script {
    string public constant NAME = "TestToken";
    string public constant SYMBOL = "TT";
    uint256 public constant INITIAL_SUPPLY = 1_000_000_000 ether; // 10 million tokens with 18 decimal places

    function run() external returns (Token) {
        vm.startBroadcast();
        Token token = new Token(NAME, SYMBOL, INITIAL_SUPPLY);
        vm.stopBroadcast();
        return token;
    }
}
