//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract String {
    bytes str = "Hello, World!!";

    function setString() public {
        // bytes(str)[5] = 'o';  < < - - if use string !!
        str[5] = 'o';
    }

    function getString() public view returns(bytes memory) {
        return str;
    }
}