// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./OwnablePermissions.sol";
import "../../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

abstract contract OwnableInitializable is OwnablePermissions, Ownable {

    error InitializableOwnable__OwnerAlreadyInitialized();

    bool private _ownerInitialized;

    /**
     * @dev When EIP-1167 is used to clone a contract that inherits Ownable permissions,
     * this is required to assign the initial contract owner, as the constructor is
     * not called during the cloning process.
     */
    function initializeOwner(address owner_) public {
      if (owner() != address(0) || _ownerInitialized) {
          revert InitializableOwnable__OwnerAlreadyInitialized();
      }

      _transferOwnership(owner_);
      _ownerInitialized = true;
    }

    function renounceOwnership() public override {
        super.renounceOwnership();

        // Ensure _ownerInitialized flag is true to prevent recapture of ownership.
        _ownerInitialized = true;
    }

    function _requireCallerIsContractOwner() internal view virtual override {
        _checkOwner();
    }
}
