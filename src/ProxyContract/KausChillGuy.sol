// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// OpenZeppelin Upgradeable ERC721
import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
// For initializer
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract KausChillGuy is Initializable, ERC721Upgradeable {
    // You can add state variables here, 
    // like minting counters or base URIs, as long as you manage them carefully for upgrades

    /// @notice This function replaces the constructor in upgradeable contracts.
    ///         It's called only once through the proxy, right after deployment.
    function initialize(string memory _name, string memory _symbol) public initializer {
        __ERC721_init(_name, _symbol);
    }

    /// @dev Example mint function
    function mint(address to, uint256 tokenId) external {
        _mint(to, tokenId);
    }

}
