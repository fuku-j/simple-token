// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {SimpleToken} from "src/SimpleToken/SimpleToken.sol";
import {ERC20Token} from "src/SimpleToken/ERC20Token.sol";

contract TestSimpleToken is Test {
    SimpleToken st;
    ERC20Token e20;
    address owner;
    address appUser;

    function setUp() public {
        owner = makeAddr("Queen");
        appUser = makeAddr("Rabbit");

        vm.prank(owner);
        e20 = new ERC20Token();

        vm.prank(owner);
        st = new SimpleToken(address(e20));
    }

    function test_Success_CallToMint_byOwner() public {
        uint256 dummyAmount = 1 * (10 ** 18);

        /// check has balance value
        vm.prank(appUser);
        assertEq(e20.balanceOf(address(appUser)), 0);

        vm.prank(owner);
        /// mint to investor, amount
        st.testMintTo(address(appUser), dummyAmount);

        /// check has balance value
        vm.prank(appUser);
        assertEq(e20.balanceOf(address(appUser)), dummyAmount);
    }
}
