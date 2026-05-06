// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    
    function sendAlert(address hero, uint256 enemies, bool armed) external {
        // 1. Create the payload using abi.encodeWithSignature
        // Make sure to use "uint256" and not just "uint"!
        bytes memory payload = abi.encodeWithSignature(
            "alert(uint256,bool)", 
            enemies, 
            armed
        );
        
        // 2. Make the low-level call to the hero
        (bool success, ) = hero.call(payload);
        
        // 3. Ensure the call was successful
        require(success, "Alert failed!");
    }
}