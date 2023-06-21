// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Coin2.sol";

contract Coin2Script is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();

        new TESTCOIN2();
        
        // vm.stopBroadcast();
    }
}
