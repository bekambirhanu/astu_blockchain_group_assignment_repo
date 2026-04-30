// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract VoteMemory {
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

	function getVoters() external view returns (address[] memory) {
		address[] memory voters = new address[](votes.length);
		for (uint i = 0; i < votes.length; i++) {
			voters[i] = votes[i].voter;
		}
		return voters;
	}
}

