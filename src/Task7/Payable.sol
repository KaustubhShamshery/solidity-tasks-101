// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayMe {
    event Received(address sender, uint256 amount, string message);

    receive() external payable {
        emit Received(msg.sender, msg.value, "Received ETH");
    }

    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback");
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
