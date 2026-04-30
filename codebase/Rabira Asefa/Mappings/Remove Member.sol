// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    mapping(address => bool) public members;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function addMember(address user) external onlyOwner {
        members[user] = true;
    }

    function isMember(address user) external view returns (bool) {
        return members[user];
    }

    function removeMember(address user) external onlyOwner {
        members[user] = false;
    }
}