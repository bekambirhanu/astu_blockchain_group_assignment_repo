// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    
    function makeContact(address hero) external {
        // 1. Create a payload for a function that doesn't exist on the Hero contract.
        // This will create a 4-byte signature that doesn't match anything.
        bytes memory payload = abi.encodeWithSignature("thisFunctionDoesNotExist()");
        
        // 2. Send the payload using .call()
        (bool success, ) = hero.call(payload);
        
        // 3. Ensure it didn't revert
        require(success, "Contact failed!");
    }
}