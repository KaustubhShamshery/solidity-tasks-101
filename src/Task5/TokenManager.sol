// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenManager is Ownable(msg.sender) {
    // Mapping to track token balances for this contract
    mapping(address => uint256) public tokenBalances;

    // Event logging deposits & withdrawals
    event TokenDeposited(address indexed user, address indexed token, uint256 amount);
    event TokenWithdrawn(address indexed user, address indexed token, uint256 amount);

    /**
     * @dev Allows the owner to deposit tokens into the contract.
     * @param token The address of the ERC20 token.
     * @param amount The amount of tokens to deposit.
     */
    function depositTokens(address token, uint256 amount) external onlyOwner {
        require(amount > 0, "Amount must be greater than zero");

        IERC20 erc20 = IERC20(token);
        require(erc20.transferFrom(msg.sender, address(this), amount), "Transfer failed");

        tokenBalances[token] += amount;

        emit TokenDeposited(msg.sender, token, amount);
    }

    /**
     * @dev Allows the owner to withdraw tokens from the contract.
     * @param token The address of the ERC20 token.
     * @param amount The amount of tokens to withdraw.
     */
    function withdrawTokens(address token, uint256 amount) external onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        require(tokenBalances[token] >= amount, "Insufficient balance");

        IERC20 erc20 = IERC20(token);
        require(erc20.transfer(msg.sender, amount), "Transfer failed");

        tokenBalances[token] -= amount;

        emit TokenWithdrawn(msg.sender, token, amount);
    }

    /**
     * @dev Check the token balance of the contract.
     * @param token The address of the ERC20 token.
     * @return The balance of the token held by the contract.
     */
    function contractTokenBalance(address token) external view returns (uint256) {
        return IERC20(token).balanceOf(address(this));
    }
}
