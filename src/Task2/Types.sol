pragma solidity ^0.8.0;

contract BasicDataTypes {
    uint256 public number = 42;
    bool private isActive = true;
    string internal message = "Hello, Solidity!";
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }

    function getMessage() internal view returns (string memory) {
        return message;
    }

    function isContractActive() private view returns (bool) {
        return isActive;
    }

    function addNumbers(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
}
