//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract owned {
    address owner;
    constructor() {
        owner = msg.sender;
    }



}