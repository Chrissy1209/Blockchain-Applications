//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Events {
    string userName;
    uint8 age;
    
    event userInfo(
        string name, 
        uint8 age
    );

    function setInfo(string calldata _userName, uint8 _age) public {
        userName = _userName;
        age = _age;
        emit userInfo(_userName, _age);
    }

    function getInfo() public view returns(string memory, uint8) {
        return (userName, age);
    }

}