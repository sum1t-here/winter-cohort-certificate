// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NftContract is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToURI;

    constructor() ERC721("Winter Cohort Certificate", "WCC") {}

    function mintBatch(string[] memory tokenUris) public {
        uint256 length = tokenUris.length;

        for (uint256 i = 0; i < length; i++) {
            s_tokenIdToURI[s_tokenCounter] = tokenUris[i];
            _safeMint(msg.sender, s_tokenCounter);
            s_tokenCounter++;
        }
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdToURI[tokenId];
    }
}
