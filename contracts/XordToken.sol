// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract XordToken{
    // Constructor
    // Set the total number of tokens
    // Read the total number of tokens
    //name
    string public name = "Water";
    //symbol
    string public symbol= "WATER";
    //decimals
    //total supply
    uint256 public totalSupply;
    event Transfer(
         address indexed _from,
        address indexed _to,
        uint256 _value
    );
    mapping(address => uint256) public balanceOf;
    
    constructor(uint256 _initialSupply) public{
        balanceOf[msg.sender]=_initialSupply;
        totalSupply = _initialSupply;       
    }
    
    //Transfer function
    
    function transfer(address _to, uint256 _value)public returns(bool success){
    // Trigger an Exception if account doesn't have enough
    require(balanceOf[msg.sender]>=_value);
    // Return a boolean
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    //Transfer Event    
    emit Transfer(msg.sender, _to, _value);
    return true;
    }

}