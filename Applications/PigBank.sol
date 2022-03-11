//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract PigBank {
    uint public goal;
    constructor(uint _goal) {
        goal = _goal;
    }

    receive() external payable { }

    function withdraw() public {
        if( address(this).balance > goal) {
            selfdestruct(payable(msg.sender));
        }
    }
}