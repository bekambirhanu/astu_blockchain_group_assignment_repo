// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    mapping(address => bool) public members;

    function addMember(address _member) external {
        members[_member] = true;
    }

    function isMember(address _member) external view returns (bool) {
        return members[_member];
    }

    // 1. Create the external function to remove a member
    function removeMember(address _member) external {
        // 2. Set the boolean value back to false for the given address key
        members[_member] = false;
    }
}