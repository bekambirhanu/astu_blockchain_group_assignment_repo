contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;
    mapping(address => bool) public members;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    mapping(uint => mapping(address => bool)) private receipts;
    mapping(uint => mapping(address => bool)) private hasVoted;

    constructor(address[] memory _members) {
        for(uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
        members[msg.sender] = true;
    }

    function newProposal(address _target, bytes calldata _data) external {
        require(members[msg.sender], "Not a authorized member");
        
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
        require(members[msg.sender], "Not a authorized member");
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
