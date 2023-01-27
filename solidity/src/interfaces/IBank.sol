// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IBank {
    struct Lock {
        uint256 balance;
        uint256 lockDate;
        uint256 unlockDate;
        bool isValid;
    }

    enum State {
        LOCK,
        UNLOCK
    }

    function lock(uint256) external payable;
    function unlock(uint256) external;
}