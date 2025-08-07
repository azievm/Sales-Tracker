pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import './Album.sol';

contract AlbumTracker {

  constructor() Ownable(msg.sender) {}

  enum AlbumState {
    Created, Paid, Delivered
  }

  struct AlbumProduct {
    Album album;
    AlbumState state;
    uint price;
    string title;
  }

  mapping(uint => AlbumProduct) public albums;
  uint currentIndex;

  function createAlbum(uint _price, string memory _title) public onlyOwner {
    Album newAlbum = new Album(_price, _title);

    albums[currentIndex].album = newAlbum;
    albums[currentIndex].state = AlbumState.Created;
    albums[currentIndex].price = _price;
    albums[currentIndex].title = _title;

    currentIndex++;
  }


}
