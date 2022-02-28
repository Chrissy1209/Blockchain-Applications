//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract String {
    string str = "Hello, World!!";

    function setString() public {
        bytes(str)[5] = 'o';
    }

    function getString() public view returns(string memory) {
        return str;
    }
}