// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    
    // 1. Accept the hero address and the arbitrary calldata
    function relay(address hero, bytes calldata data) external {
        
        // 2. Pass the exact calldata straight to the hero
        (bool success, ) = hero.call(data);
        
        // 3. Ensure the call didn't revert
        require(success, "Call failed!");
    }
}