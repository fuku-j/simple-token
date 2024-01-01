// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {SimpleToken} from "src/SimpleToken/SimpleToken.sol";
import {ERC20Token} from "src/SimpleToken/ERC20Token.sol";

contract SimpleTokenScript is Script {
    SimpleToken st;
    ERC20Token e20;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        e20 = new ERC20Token();
        st = new SimpleToken(address(e20));

        vm.stopBroadcast();
    }
}
