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
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );
    mapping(address => uint256) public balanceOf;
    // allowance mapping
    mapping(address => mapping(address => uint256)) public allowance;
    constructor(uint256 _initialSupply) public{
        balanceOf[msg.sender]=_initialSupply;
        totalSupply = _initialSupply;       
    }
    
    //Transfer function
    
    function transfer(address _to, uint256 _value)public returns(bool success){
    // Trigger an Exception if account doesn't have enough
    require(balanceOf[msg.sender]>=_value);
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    //Transfer Event    
    emit Transfer(msg.sender, _to, _value);
    // Return a boolean
    return true;
    }

    // Approve
    function approve(address _spender, uint256 _value)public returns(bool success){
        //allowance
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    
    // Transfer From
    function transferFrom(address _from, address _to, uint256 _value) public returns(bool success){
        // Require _from has enough tokens
        require(_value <= balanceOf[_from]);
        // Require the allowance is big enough
        require(_value <= allowance[_from][msg.sender]);
        // Change the balance
        balanceOf[_from] -= _value;
        balanceOf[_to] +=_value;
        // Update the allowance
        allowance[_from][msg.sender]-=_value;
        // Transfer event
        emit Transfer(_from, _to, _value);
        // Returns a boolean
        return true;
    }

}