pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/Task2/Types.sol";

contract BasicDataTypesTest is Test {
    BasicDataTypes basicDataTypes;

    function setUp() public {
        basicDataTypes = new BasicDataTypes();
    }

    function testGetNumber() public view {
        uint expected = 42;
        assertEq(basicDataTypes.getNumber(), expected, "getNumber should return 42");
    }

    function testAddNumbers() public view {
        uint result = basicDataTypes.addNumbers(10, 20);
        assertEq(result, 30, "addNumbers should return correct sum");
    }

    function testOwnerIsSet() public view {
        assertEq(basicDataTypes.owner(), address(this), "Owner should be the deployer");
    }
}