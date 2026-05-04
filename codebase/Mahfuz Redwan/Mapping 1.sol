contract Contract {
    mapping(address => bool) public members;

    function addMember(address _addr) external {
        members[_addr] = true;
    }
}