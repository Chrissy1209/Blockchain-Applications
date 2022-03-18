//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Owner {
    string name;
    address owner;
    constructor(){
        name = "Unknown";
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(
            msg.sender == owner, //false時呼叫revert(<string>) -> 終止並不退還所使用gas
            "Permission Denied."
            );
        _;
    }

    function setName(string calldata _name) public onlyOwner{
        name = _name;
    }

    function getName() public view returns(string memory) {
        return name;
    }
}