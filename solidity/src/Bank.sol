// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "./interfaces/IBank.sol";

contract Bank is IBank{

    uint256 public userCount;
    uint256 public constant MIN_LOCK_TIME = 3 days;
    mapping(address => mapping(uint256 => Lock)) public locks;
    mapping(address => uint256) public lockIds;

    function lock(uint256 _unlockDate) external payable {
        require(_unlockDate > block.timestamp, "Unlock time must be > block.timestamp");
        require(_unlockDate > MIN_LOCK_TIME + block.timestamp, "Unlock time must be > MIN_LOCK_TIME");
        uint256 id = lockIds[msg.sender];

        locks[msg.sender][id] = Lock(msg.value, block.timestamp, _unlockDate, true);
        lockIds[msg.sender]++;
    }

    function unlock(uint256 id) external {
        Lock storage user = locks[msg.sender][id];
        require(user.isValid, "Id is not valid");
        require(user.unlockDate >= block.timestamp, "Money is locked");


        user.isValid = false;
        payable(msg.sender).transfer(user.balance);
        // User memory user = users[msg.sender];
        // require(users[msg.sender][id] != Lock(0,0,0,false));
        // require(user.unlockDate);
        // payable(msg.sender).transfer(user.balance);
    }
}