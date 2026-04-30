// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}

	Vote[] public votes;
	
	function createVote(Choices choice) external {
		require(!hasVoted(msg.sender));
		votes.push(Vote(choice, msg.sender));
	}

	function hasVoted(address user) public view returns (bool) {
		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == user) {
				return true;
			}
		}
		return false;
	}

	function findChoice(address user) public view returns (Choices) {
		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == user) {
				return votes[i].choice;
			}
		}
		return Choices.Yes;
	}

	function changeVote(Choices choice) external {
		require(hasVoted(msg.sender));

		for (uint i = 0; i < votes.length; i++) {
			if (votes[i].voter == msg.sender) {
				votes[i].choice = choice;
				return;
			}
		}
	}
}