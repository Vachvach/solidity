// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ERC22.sol";

contract ERC22Test is Test {
    ERC22 public erc22;

    function setUp() public {
        erc22 = new ERC22();
    }


    function testDeposit() public payable {
       payable(msg.sender).transfer(msg.value);
    }

    // function testWithdrawal(uint256 _amount) public {
    //     payable(msg.sender).transfer(_amount);
    // }
}