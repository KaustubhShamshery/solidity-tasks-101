// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ErrorHandling {
    address public owner;
    uint256 public balance;

    error Unauthorized();
    error InsufficientBalance(uint256 requested, uint256 available);

    constructor() {
        owner = msg.sender;
        balance = 100;
    }

    function deposit(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        balance += amount;
    }

    function withdraw(uint256 amount) external {
        if (amount > balance) {
            revert InsufficientBalance(amount, balance);
        }
        balance -= amount;
    }

    function resetBalance() external {
        assert(balance >= 0);
        balance = 100;
    }

    function restrictedAction() view external {
        if (msg.sender != owner) {
            revert Unauthorized();
        }
    }
}