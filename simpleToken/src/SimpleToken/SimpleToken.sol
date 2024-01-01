// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20Token} from "src/SimpleToken/ERC20Token.sol";
import {Ownerable} from "src/SimpleToken/Ownerable.sol";

contract SimpleToken is Ownerable {
    ERC20Token public immutable e20;

    constructor(address erc20TokenAddress_) {
        e20 = ERC20Token(erc20TokenAddress_);
    }

    function testMintTo(address account_, uint256 amount_) external onlyOwner {
        e20.mintTo(msg.sender, account_, amount_);
    }
}
