//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyValue {
    string value;
    constructor() {
        value = "MyValue";
    }

    function setValue(string memory _value) public {
        value = _value;
    }

    function getValue() public view returns(string memory) {
        return value;
    }
}