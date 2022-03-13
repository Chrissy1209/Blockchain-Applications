//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyValue {
    bytes10 value;
    constructor() {
        value = "MyValue";
    }

    function setValue(bytes10 _value) public {
        value = _value;
        // value[3] = 's';  < < - - - error !!!
    }

    function getValue() public view returns(bytes10) {
        return value;
    }
}