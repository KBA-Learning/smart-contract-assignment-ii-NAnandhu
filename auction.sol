// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Auction {
    
    address Admin;
    address public owner;
    string Items;
    uint256 Price;

    constructor() {
        Admin = msg.sender;
    }

    modifier verify(){
        require(msg.sender == Admin,"unautherized");
        _;
    }

    function setAuction(string memory _items,uint256 _Price) public verify{
            Items = _items;
            Price = _Price;
            owner = msg.sender;
    }
    function viewAuction() public view returns(string memory,uint256){
        return (Items,Price);
    }
    function auctionCall(uint256 amount) public payable  {
        if(amount >=Price){
            Price = amount;
            owner = msg.sender;
        }else{
            payable (msg.sender).transfer(amount);
        }
    }




}