// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "../../ERC721CMetadataInitializable.sol";
import "src/minting/MerkleWhitelistMint.sol";
import "src/programmable-royalties/ImmutableMinterRoyalties.sol";

contract MerkleMock is
    ERC721CMetadataInitializable,
    MerkleWhitelistMintInitializable,
    ImmutableMinterRoyaltiesInitializable
{
    constructor() ERC721("", "") {}

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721CInitializable, ImmutableMinterRoyaltiesBase)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function _mintToken(address to, uint256 tokenId) internal virtual override {
        _onMinted(to, tokenId);
        _mint(to, tokenId);
    }
}
