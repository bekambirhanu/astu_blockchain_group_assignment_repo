// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function createVote(Choices _choice) external {
        require(!hasVoted(msg.sender), "Address has already voted");
        votes.push(Vote(_choice, msg.sender));
    }

    // 1. Create the external function to change a vote
    function changeVote(Choices _choice) external {
        // 2. Revert if the user has not voted yet
        require(hasVoted(msg.sender), "Address has not voted yet");
        
        // 3. Loop through the array to find the user's vote
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                // 4. Update the choice directly in storage
                votes[i].choice = _choice;
                // Exit the loop since we found and updated the vote
                break; 
            }
        }
    }

    function hasVoted(address _voter) public view returns (bool) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return true;
            }
        }
        return false;
    }

    function findChoice(address _voter) external view returns (Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == _voter) {
                return votes[i].choice;
            }
        }
        // Default return if not found (though usually we'd check hasVoted first)
        return Choices.Yes; 
    }
}