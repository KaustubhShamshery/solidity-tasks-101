// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract GasInefficient {
    uint256 public counter;
    address public owner = msg.sender;

    event Incremented(uint256 newCounter);

    constructor() {}

    function increment() external {
        for (uint256 i = 0; i < 100; i++) {
            counter += 1;
            uint256 a = 1 / counter;
        }
    }

    function getOwner() external view returns (address) {
        return owner;
    }
}
