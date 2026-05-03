contract StackClub {
    address[] public members;

    constructor() {
        
        members.push(msg.sender);
    }

    function addMember(address _newMember) external {
        
        require(isMember(msg.sender), "Caller is not a member");
        members.push(_newMember);
    }

    function removeLastMember() external {
        
        require(isMember(msg.sender), "Caller is not a member");
        
        require(members.length > 0, "No members to remove");
        
        members.pop();
    }

    function isMember(address _addr) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == _addr) {
                return true;
            }
        }
        return false;
    }
}
