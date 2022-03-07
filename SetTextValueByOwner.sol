//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Owner {
    string name;
    address owner;
    constructor(){
        name = "Unknown";
        owner = msg.sender;
    }

    function setName(string memory _name) public {
        if(msg.sender == owner) 
            name = _name;
        else 
            revert("Permission Denied.");
    }

    function getName() public view returns(string memory) {
        return name;
    }
}