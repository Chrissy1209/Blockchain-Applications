//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyValue {
    bytes value;
    constructor() {
        value = "MyValue";
    }

    function setValue(bytes memory _value) public {
        value = _value;
    }

    function getValue() public view returns(bytes memory) {
        return value;
    }
}