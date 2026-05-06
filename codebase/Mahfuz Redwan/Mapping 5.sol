contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        require(!users[msg.sender].isActive, "User already exists");
        users[msg.sender] = User({
            balance: 100,
            isActive: true
        });
    }

    function transfer(address _recipient, uint _amount) external {
        require(users[msg.sender].isActive, "Sender must be active");
        require(users[_recipient].isActive, "Recipient must be active");
        require(users[msg.sender].balance >= _amount, "Insufficient balance");

        users[msg.sender].balance -= _amount;
        users[_recipient].balance += _amount;
    }
}
