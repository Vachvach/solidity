// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13; 

contract ERC22 { 
    address public owner;
    mapping(address => bool) public registeredUsers;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, 'You are not owner');
        _;
    }

    modifier onlyRegistered() {
        require(registeredUsers[msg.sender]);
        _;
    }

    modifier onlyLessThan10000(uint256 amount) {
        require(amount <= 10000, 'Only less tha 10k');
        _;
    }

    function registered(address user) public {
        registeredUsers[user] = true;
    }

    function deleteUser(address user) public {
        registeredUsers[user] = false;
    }

    function deposit() public payable onlyRegistered {
       payable(msg.sender).transfer(msg.value);
    }

    function withdrawal(uint256 amount) public onlyRegistered onlyLessThan10000(amount) {
        payable(msg.sender).transfer(amount);
    }

}
