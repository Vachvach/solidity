// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13; 

interface IOOP { // extrenal or public
    function boo() external;
}

abstract contract AOOP {
    uint256 public number =1000;

    function viewnumber() public view returns(uint256) {
        return number;
    }
}

contract OOP { //overide(OOP,OOP1)
    function foo1() internal virtual{ //kontrakti mejic ev jarange(protected)

    }

    function foo2() external virtual { //miayn drsic
        
    }
}

contract OOP1 is OOP {
    function foo2() external override {

    }
}
