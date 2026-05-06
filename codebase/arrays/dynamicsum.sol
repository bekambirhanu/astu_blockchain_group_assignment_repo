// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    
    // 1. Create the external pure function that takes a dynamic array of uints
    function sum(uint[] calldata numbers) external pure returns (uint) {
        
        // 2. Initialize the total sum variable
        uint total = 0;
        
        // 3. Use numbers.length to loop through whatever size the array happens to be
        for(uint i = 0; i < numbers.length; i++) {
            total += numbers[i];
        }
        
        // 4. Return the final sum
        return total;
    }
}