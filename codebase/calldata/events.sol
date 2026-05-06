// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    // 1. Declare the event with a uint parameter for the balance
    event Approved(uint);

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    function approve() external {
        require(msg.sender == arbiter, "Only arbiter can approve");
        
        uint256 balance = address(this).balance;
        
        (bool success, ) = beneficiary.call{value: balance}("");
        require(success, "Transfer failed");
        
        // 2. Emit the event, passing in the balance that was transferred
        emit Approved(balance);
    }
}