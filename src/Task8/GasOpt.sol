pragma solidity ^0.8.0;
contract GasOptimized {
    uint128 public counter;  
    address public immutable owner;  

    event Incremented(uint128 newCounter);

    constructor() {
        owner = msg.sender;  
    }

    function increment() external {
        
            for (uint256 i = 0; i < 100; i++) {
                unchecked {
                    counter += 1;
                    uint256 a = 1/counter;
                }
            }
        
    }

    function getOwner() external view returns (address) {
        return owner;  
    }
}