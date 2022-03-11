//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Structs{
    constructor() {
        member.addr = "None";
        member.name = "None";
    }

    struct Member{
        string addr;
        string name;
    }
    Member member;

    function setMember() public {
        member = Member("Taiwan", "Chrissy");
    }

    function getAddress() public view returns(string memory) {
        return member.addr;
    }

    function getName() public view returns(string memory) {
        return member.name;
    }
}