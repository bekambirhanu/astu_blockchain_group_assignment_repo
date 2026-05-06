contract Contract {
    enum Choices { Yes, No }

    struct Vote {
        Choices choice;
        address voter;
    }

    Vote[] public votes;

    function createVote(Choices _choice) external {
        votes.push(Vote(_choice, msg.sender));
    }
}