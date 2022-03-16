//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Test {
    string info;
    uint balance;

    event one(string info, uint balance);
    event two(string indexed info, uint indexed balance);
    constructor() {
        info = "default";
        balance = 10;
        emit one(info, balance);
        emit two(info, balance);
    }
}