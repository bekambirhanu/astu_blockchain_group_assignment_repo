// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VotingEvents {
	struct Proposal {
		address target;
		bytes data;
		uint yesCount;
		uint noCount;
		bool executed;
	}

	Proposal[] public proposals;
	mapping(uint => mapping(address => bool)) public hasVoted;
	mapping(address => bool) public members;

	event ProposalCreated(uint indexed proposalId, address proposer);
	event VoteCast(uint indexed proposalId, address indexed voter, bool support);

	constructor(address[] memory initialMembers) {
		members[msg.sender] = true;
		for (uint i = 0; i < initialMembers.length; i++) {
			members[initialMembers[i]] = true;
		}
	}

	function newProposal(address target, bytes calldata data) external {
		require(members[msg.sender], "not member");

		proposals.push(Proposal({
			target: target,
			data: data,
			yesCount: 0,
			noCount: 0,
			executed: false
		}));

		emit ProposalCreated(proposals.length - 1, msg.sender);
	}

	function castVote(uint proposalId, bool support) external {
		require(members[msg.sender], "not member");

		Proposal storage proposal = proposals[proposalId];
		if (hasVoted[proposalId][msg.sender]) return;

		hasVoted[proposalId][msg.sender] = true;
		if (support) {
			proposal.yesCount++;
		} else {
			proposal.noCount++;
		}

		emit VoteCast(proposalId, msg.sender, support);
	}
}
