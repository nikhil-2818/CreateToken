//SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract OwnToken {
    string public name = "CoderCoin";
    string public symbol = "CC";
    uint256 public totalSupply = 0;
    mapping(address => uint256) public balances;
    address public owner = msg.sender;


    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        totalSupply += _amount;
        balances[_to] += _amount;
    }

    function transfer(address _from,address _to, uint256 _amount) public {
        require(balances[_from] >= _amount, "Insufficient balance");
        require(_from != address(0), "Invalid sender address");
        require(_to != address(0), "Invalid receiver address");
        balances[_from] -= _amount;
        balances[_to] += _amount;
    }

    function burn(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        totalSupply -= _amount;
    }
}


