// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "../../lib/openzeppelin-contracts/contracts/utils/introspection/IERC165.sol";

interface IEOARegistry is IERC165 {
    function isVerifiedEOA(address account) external view returns (bool);
}