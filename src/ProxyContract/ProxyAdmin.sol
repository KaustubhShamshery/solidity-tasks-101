// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/proxy/transparent/ProxyAdmin.sol";

contract KausProxyAdmin is ProxyAdmin {
    constructor(address _owner) ProxyAdmin(_owner) {}
}
