// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TESTCOIN2 is ERC20 {
    address public owner;
    uint256 price = 10000000000000000; // 0.01 ether in wei
    
    constructor() ERC20('TESTCOIN', 'SIL') {
        owner = msg.sender;
        _mint(owner, 5 * (10**9));
    }

    modifier onlyOwner(){
        require(msg.sender==owner,"Only the owner can call this!");
        _;
    }

    // modifier valueBiggerThan() {
    //     require(msg.val>10, "Value too small");
    //     _;
    // }

    function burnFrom(address from, uint256 value) public onlyOwner {
        _burn(from, value);
    }
    
    function burn(uint256 value) public onlyOwner {
        _burn(msg.sender, value);
    }
    
    function mint(uint256 _value) public onlyOwner {
        
        _mint(msg.sender, _value);
    }

    function Buy(uint256 TokenAmount) public payable {
        uint256 amount = EthToToken(TokenAmount);
        require(amount <= msg.value, "Pay more Ether to get tokens.");
        _transfer(address(owner), msg.sender, TokenAmount);
    }

    function EthToToken(uint256 TokenAmount) public view returns(uint256) {
        return (TokenAmount * price);
    }
    
    function changePrice(uint256 _Amount) public onlyOwner {
       price = _Amount;
    }
}
