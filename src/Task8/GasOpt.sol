pragma solidity ^0.8.0;
contract GasOptimized {
    uint128 public counter;  
    address public immutable owner;  

    event Incremented(uint128 newCounter);

    constructor() {
        owner = msg.sender;  
    }

    function increment() external {
        unchecked {
            counter += 1;  
        }
        emit Incremented(counter);
    }

    function getOwner() external view returns (address) {
        return owner;  
    }
}