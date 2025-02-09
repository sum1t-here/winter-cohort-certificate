// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import "../src/NftContract.sol";

contract NftContractTest is Test {
    NftContract nft;
    address USER = makeAddr("USER");

    function setUp() public {
        nft = new NftContract();
    }

    function testMint() public {
        string[] memory uris = new string[](4);
        uris[0] = "https://example.com/nft1.json";
        uris[1] = "https://example.com/nft2.json";
        uris[2] = "https://example.com/nft3.json";
        uris[3] = "https://example.com/nft4.json";

        vm.prank(USER);
        nft.mintBatch(uris);

        // Check if tokens exist and their URIs are correctly stored
        assertEq(nft.tokenURI(0), uris[0]);
        assertEq(nft.tokenURI(1), uris[1]);
        assertEq(nft.tokenURI(2), uris[2]);
        assertEq(nft.tokenURI(3), uris[3]);

        // Verify ownership
        assertEq(nft.ownerOf(0), USER);
        assertEq(nft.ownerOf(1), USER);
        assertEq(nft.ownerOf(2), USER);
        assertEq(nft.ownerOf(3), USER);

        // Check balance
        assertEq(nft.balanceOf(USER), 4);
    }
}
