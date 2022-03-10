//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

library Math {
    function add(uint a, uint b) public pure returns(uint) {
        return a+b;
    }
}

contract libraries {
    function test(uint a, uint b) public pure returns(uint) {
        return Math.add(a, b);
    }
}