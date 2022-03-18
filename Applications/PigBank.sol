//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
/**
* 1.實作小豬撲滿存錢概念
* 2.超過設定目標（即將撲滿存滿）才可領錢
*/
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