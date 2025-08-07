pragma solidity ^0.8.0;

contract Album {
  uint public price;
  string public title;
    
  constructor(uint _price, string memory _title) {
    price = _price;
    title = _title;
  }
}
