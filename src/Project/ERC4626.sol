// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./KausERC20.sol";

contract SimpleERC4626Vault is ERC4626, Ownable {
    uint256 public maxDepositValue;

    constructor(IERC20 asset_, uint256 maxDeposit_)
        ERC4626(asset_)
        ERC20("Kaus Vault Token", "KVT")
        Ownable(msg.sender)
    {
        maxDepositValue = maxDeposit_;
    }

    /// @notice Override to ensure 1:1 deposit and mint ratio
    function convertToShares(uint256 assets) public view override returns (uint256) {
        return assets;
    }

    /// @notice Override to ensure 1:1 redemption and burn ratio
    function convertToAssets(uint256 shares) public view override returns (uint256) {
        return shares;
    }

    /// @notice Override maxDeposit to prevent overflow
    function maxDeposit(address) public view override returns (uint256) {
        return maxDepositValue;
    }

    /// @notice Override maxMint to prevent overflow
    function maxMint(address) public view override returns (uint256) {
        return maxDepositValue;
    }
}
