pragma solidity ^0.8.20;

contract OrderBook {
    event OrderPlaced(address indexed trader, uint256 amount, uint256 price);

    function placeOrder(uint256 amount, uint256 price) external {
        emit OrderPlaced(msg.sender, amount, price);
    }
}