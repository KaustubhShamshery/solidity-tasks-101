pragma solidity ^0.8.0;

contract BasicDataTypes {

    uint public number = 42;
    bool private isActive = true;
    string internal message = "Hello, Solidity!";
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function getNumber() public view returns (uint) {
        return number;
    }

    function getMessage() internal view returns (string memory) {
        return message;
    }

    function isContractActive() private view returns (bool) {
        return isActive;
    }

    function addNumbers(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
}