// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function sendAlert(address hero) external {
        // 1. The function signature string is "alert()"
        // We take the keccak256 hash of it and cast it to bytes4
        bytes4 signature = bytes4(keccak256("alert()"));
        
        // 2. We pass the 4-byte signature as calldata using .call()
        (bool success, ) = hero.call(abi.encodePacked(signature));
        
        // 3. Make sure the call was successful
        require(success, "Alert failed!");
    }
}