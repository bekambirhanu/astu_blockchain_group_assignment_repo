// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    
    // 1. Create the external pure function that takes a fixed array of 5 uints
    function sum(uint[5] calldata numbers) external pure returns (uint) {
        // 2. Initialize a variable to keep track of the total sum
        uint total = 0;
        
        // 3. Use a for loop to iterate through the 5 elements
        for(uint i = 0; i < 5; i++) {
            total += numbers[i];
        }
        
        // 4. Return the final sum
        return total;
    }
}