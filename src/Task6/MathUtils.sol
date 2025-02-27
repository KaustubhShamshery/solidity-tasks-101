// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library MathUtils {
    function double(uint256 num) internal pure returns (uint256) {
        return num * 2;
    }

    function exponent(uint256 base, uint256 exp) internal pure returns (uint256) {
        return base ** exp;
    }

    function sqrt(uint256 num) internal pure returns (uint256) {
        return uint256(sqrt(num));
    }
}
