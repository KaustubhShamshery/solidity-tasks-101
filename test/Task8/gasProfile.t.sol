// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "forge-std/Test.sol";
import "../../src/Task8/Ineffecient.sol";
import "../../src/Task8/GasOpt.sol";

contract GasComparisonTest is Test {
    GasInefficient inefficient;
    GasOptimized optimized;

    function setUp() public {
        inefficient = new GasInefficient();
        optimized = new GasOptimized();
    }

    function testGasInefficientIncrement() public {
        uint256 gasUsed = gasleft();
        inefficient.increment();
        gasUsed -= gasleft();
        emit log_named_uint("Gas used (Inefficient increment)", gasUsed);
    }

    function testGasOptimizedIncrement() public {
        uint256 gasUsed = gasleft();
        optimized.increment();
        gasUsed -= gasleft();
        emit log_named_uint("Gas used (Optimized increment)", gasUsed);
    }

    function testGasOwnerOptimized() public {
        uint256 gasUsed = gasleft();
        gasUsed = gasleft();
        optimized.getOwner();
        gasUsed -= gasleft();
        emit log_named_uint("Gas used (Optimized getOwner)", gasUsed);
    }

    function testGasOwnerInefficient() public {
        uint256 gasUsed = gasleft();
        inefficient.getOwner();
        gasUsed -= gasleft();
        emit log_named_uint("Gas used (Inefficient getOwner)", gasUsed);
    }
}
