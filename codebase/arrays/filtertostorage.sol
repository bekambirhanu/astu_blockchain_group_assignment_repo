// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    // 1. Create a public, dynamic sized array of unsigned integers in storage
    uint[] public evenNumbers;

    // 2. Create the external function taking a dynamic array of uints
    function filterEven(uint[] calldata numbers) external {
        // 3. Loop through the array
        for(uint i = 0; i < numbers.length; i++) {
            // 4. Check if the number is even using the modulo operator (%)
            if (numbers[i] % 2 == 0) {
                // 5. If it's even, push it into our storage array
                evenNumbers.push(numbers[i]);
            }
        }
    }
}