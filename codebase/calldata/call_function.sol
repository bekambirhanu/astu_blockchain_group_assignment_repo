// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 1. Define the interface with the function we want to call
interface IHero {
    function alert() external;
}

contract Sidekick {
    
    // 2. Use the interface to call the function on the provided address
    function sendAlert(address hero) external {
        IHero(hero).alert();
    }
}