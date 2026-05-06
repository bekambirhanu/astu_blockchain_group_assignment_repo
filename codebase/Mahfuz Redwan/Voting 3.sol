contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    
    mapping(uint => mapping(address => bool)) private receipts;
    
    mapping(uint => mapping(address => bool)) private hasVoted;

    function newProposal(address _target, bytes calldata _data) external {
        proposals.push(Proposal({
            target: _target,
            data: _data,
            yesCount: 0,
            noCount: 0
        }));
    }

    function castVote(uint _proposalId, bool _supports) external {
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
            } else {
                return;
            }
        } else {
           
            if (_supports) {
                proposal.yesCount++;
            } else {
                proposal.noCount++;
            }
            hasVoted[_proposalId][msg.sender] = true;
        }

        
        receipts[_proposalId][msg.sender] = _supports;
    }
}

