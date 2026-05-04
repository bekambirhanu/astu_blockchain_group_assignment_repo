contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    mapping(uint => mapping(address => bool)) private receipts;
    mapping(uint => mapping(address => bool)) private hasVoted;

    function newProposal(address _target, bytes calldata _data) external {
        uint proposalId = proposals.length;
        
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));

        emit ProposalCreated(proposalId);
    }

    function castVote(uint _proposalId, bool _supports) external {
        require(_proposalId < proposals.length, "Index out of bounds");
        Proposal storage proposal = proposals[_proposalId];

        if (hasVoted[_proposalId][msg.sender]) {
            if (receipts[_proposalId][msg.sender] != _supports) {
                if (_supports) {
                    proposal.noCount--;
                    proposal.yesCount++;
                } else {
                    proposal.yesCount--;
                    proposal.noCount++;
                }
                receipts[_proposalId][msg.sender] = _supports;
            }
            // Removed the "return" so the event always fires
        } else {
            if (_supports) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
            hasVoted[_proposalId][msg.sender] = true;
            receipts[_proposalId][msg.sender] = _supports;
        }

        emit VoteCast(_proposalId, msg.sender);
    }
}

