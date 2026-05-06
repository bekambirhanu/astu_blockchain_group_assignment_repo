// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StackClub {
    address[] public members;

    // 1. Constructor adds the deployer as the first member
    constructor() {
        members.push(msg.sender);
    }

    // 2. Secure addMember to only allow existing members
    function addMember(address _member) external {
        require(isMember(msg.sender), "Caller is not a member");
        members.push(_member);
    }

    // 3. Create removeLastMember and secure it
    function removeLastMember() external {
        require(isMember(msg.sender), "Caller is not a member");
        
        // .pop() removes the very last item in a storage array
        members.pop();
    }

    // Existing isMember function
    function isMember(address _member) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == _member) {
                return true; 
            }
        }
        return false;
    }
}