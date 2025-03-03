// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract KausChillGuyProxy is TransparentUpgradeableProxy {
    constructor(
        address _logic,        // Address of the implementation (MyNFTUpgradeable)
        address admin_,        // Address of the ProxyAdmin
        bytes memory _data     // Data to call the implementation with (usually the initializer)
    )
        TransparentUpgradeableProxy(_logic, admin_, _data)
    {}
}
