// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;
    address public charity;

    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }

    receive() external payable {}

    function tip() public payable {
        (bool success, ) = owner.call{value: msg.value}("");
        require(success);
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function donate() external onlyOwner {
        uint256 bal = address(this).balance;
        if (bal == 0) return;
        (bool success, ) = payable(charity).call{value: bal}("");
        require(success);
    }
}