// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.8;

contract ERC20 {
    string public name = "ERC20 TOKEN";
    string public symbol = "ERC20";
    uint256 public totalSuply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    function transfer(address _to, uint256 _amount) public returns(bool success) {
        require(balanceOf[msg.sender] >= _amount);
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;

        return true;
    }

    function approval(address _spender, uint256 _value) public returns(bool success) {
        allowance[msg.sender][_spender] = _value;

        return true;
    }

    function transferFrom(address _from, address _to, uint256 amount) public {
        require(balanceOf[_from] >= amount);
        require(allowance[_from][msg.sender] >= amount);

        balanceOf[_from] -= amount;
        balanceOf[_to] += amount;
        
    }
}