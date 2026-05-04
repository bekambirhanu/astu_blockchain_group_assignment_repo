
contract Contract {
    enum ConnectionTypes { 
        Unacquainted, 
        Friend, 
        Family, 
        Spouse 
    }

    mapping(address => mapping(address => ConnectionTypes)) public connections;

    function connectWith(address other, ConnectionTypes connectionType) external {
        connections[msg.sender][other] = connectionType;
    }
}