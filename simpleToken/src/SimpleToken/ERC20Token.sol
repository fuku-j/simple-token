// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownerable} from "src/SimpleToken/Ownerable.sol";

contract ERC20Token is ERC20("Simple ERC20 Token", "SET"), Ownerable {
    uint256 constant _initialSupply = 1200_000_000;

    constructor() {
        _mint(address(this), _initialSupply * (10 ** 18));
    }

    function mintTo(
        address from_,
        address to_,
        uint256 amount_
    ) external validOwner(from_) {
        _mint(to_, amount_);
    }

    modifier validOwner(address caller_) {
        require(_isContractOwner(caller_), "caller is only owner");
        _;
    }

    function _isContractOwner(address caller_) internal view returns (bool) {
        return caller_ == owner();
    }
}
