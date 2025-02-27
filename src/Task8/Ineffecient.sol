// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract GasInefficient {
    uint256 public counter;  
    address public owner = msg.sender;  

    event Incremented(uint256 newCounter);

    constructor() {}

    function increment() external {
        counter += 1;  
        emit Incremented(counter);
    }

    function getOwner() external view returns (address) {
        return owner;  
    }
}
