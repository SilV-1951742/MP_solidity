// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Coin.sol";

contract CoinScript is Script {
    function setUp() public {}

    function run() public {
        address owner = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

        
        vm.broadcast();

        new TESTCOIN(owner);
        
        // vm.stopBroadcast();
    }
}
