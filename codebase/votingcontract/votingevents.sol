// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed; // 1. Add an executed status
    }

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    Proposal[] public proposals;

    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public previousVote;
    mapping(address => bool) public members;

    constructor(address[] memory _members) {
        members[msg.sender] = true;
        for (uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
    }

    function newProposal(address _target, bytes calldata _data) external {
        require(members[msg.sender], "Not an authorized member");

        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0,
            executed: false // 2. Initialize the executed status to false
        }));

        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalId, bool supportsProposal) external {
        require(members[msg.sender], "Not an authorized member");

        Proposal storage proposal = proposals[proposalId];

        // 3. Security: Prevent voting on (or re-executing) a completed proposal
        require(!proposal.executed, "Proposal has already been executed");

        if (hasVoted[proposalId][msg.sender]) {
            if (previousVote[proposalId][msg.sender] != supportsProposal) {
                if (supportsProposal) {
                    proposal.yesCount++;
                    proposal.noCount--;
                } else {
                    proposal.noCount++;
                    proposal.yesCount--;
                }
                previousVote[proposalId][msg.sender] = supportsProposal;
            }
        } else {
            if (supportsProposal) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
            hasVoted[proposalId][msg.sender] = true;
            previousVote[proposalId][msg.sender] = supportsProposal;
        }

        // 4. Execution Logic: Check if threshold is met
        if (proposal.yesCount >= 10) {
            // Mark as executed immediately to prevent re-entrancy / double execution
            proposal.executed = true;

            // Execute the payload via low-level call
            (bool success, ) = proposal.target.call(proposal.data);
            require(success, "Proposal execution failed");
        }

        emit VoteCast(proposalId, msg.sender);
    }
}
