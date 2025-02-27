pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../../src/Task1/HelloWorld.sol";

contract HelloWorldTest is Test {
    HelloWorld hello;

    function setUp() public {
        hello = new HelloWorld("Hello, Foundry!");
    }

    function testGetGreeting() public view {
        assertEq(hello.getGreeting(), "Hello, Foundry!");
    }

    function testSetGreeting() public {
        hello.setGreeting("Hello, Ethereum!");
        assertEq(hello.getGreeting(), "Hello, Ethereum!");
    }
}