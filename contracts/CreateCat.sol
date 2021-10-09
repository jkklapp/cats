// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract CreateCat {
  event NewCat(uint id, string name, uint dna);

  uint dnaDigits = 16;
  uint dnaModulus = 10 ** dnaDigits;

  struct Cat {
    string name;
    uint dna;
  }

  Cat[] public cats;

  function _createCat(string memory _name, uint _dna) private {
    cats.push(Cat(_name, _dna));
    uint id = cats.length - 1;
    emit NewCat(id, _name, _dna);
  }

  function _generateRandomDna(string memory _str) private view returns (uint) {
    uint rand = uint(keccak256(abi.encodePacked(_str)));
    return rand % dnaModulus;
  }

  function createRandomCat(string memory _name) public {
    uint randDna = _generateRandomDna(_name);
    _createCat(_name, randDna); 
  }

}
