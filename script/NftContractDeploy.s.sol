// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {NftContract} from "../src/NftContract.sol"; // Update path if needed

contract DeployNftContract is Script {
    function run() external {
        vm.startBroadcast(); // Uses private key from Foundry environment

        NftContract nft = new NftContract(); // Deploy contract

        vm.stopBroadcast();

        console.log("Contract deployed at:", address(nft));
    }
}
