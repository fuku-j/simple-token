// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {ERC20Token} from "src/SimpleToken/ERC20Token.sol";

contract TestERC20Token is Test {
    ERC20Token st;
    address owner;
    address appUser;
    uint256 constant totalSupply = 1200000000 * (10 ** 18);

    function setUp() public {
        owner = makeAddr("Queen");
        appUser = makeAddr("Rabbit");

        vm.prank(owner);
        st = new ERC20Token();
    }

    function test_IsseuTokenReturnBalance_byOwner() public {
        vm.startPrank(owner);

        /// check initial supply value
        assertEq(st.balanceOf(address(st)), totalSupply);

        vm.stopPrank();
    }

    function test_toMIntTokenReturnBalance_byOwner() public {
        uint256 dummyAmount = 1 * (10 ** 18);

        /// check has balance value
        vm.prank(appUser);
        assertEq(st.balanceOf(address(appUser)), 0);

        vm.prank(owner);
        /// mint to investor, amount
        st.mintTo(address(owner), address(appUser), dummyAmount);

        /// check has balance value
        vm.prank(appUser);
        assertEq(st.balanceOf(address(appUser)), dummyAmount);
    }
}
