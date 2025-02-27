pragma solidity ^0.8.20;

import "./MathUtils.sol";

contract Calc {


    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict function access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // Function that uses the MathUtils library
    function getDouble(uint256 num) public view onlyOwner returns (uint256) {
        return MathUtils.double(num);
    }

    function getExponent(uint256 base, uint256 exp) public view onlyOwner returns (uint256) {
        return MathUtils.exponent(base, exp);
    }

    function getSqrt(uint256 num) public pure returns (uint256) {
        return MathUtils.sqrt(num);
    }
}