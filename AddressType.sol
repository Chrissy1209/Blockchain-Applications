//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Address {
    receive() external payable {}
    function balance() public view returns(uint){
        return address(this).balance;
    }
    function transfer(uint amount) public {
        payable(msg.sender).transfer(amount * 1 ether);
    }
    function sendWithoutCheck(uint amount) public {
        payable(msg.sender).send(amount * 1 ether);
    }
    function sendWithCheck(uint amount) public {
        require(payable(msg.sender).send(amount * 1 ether), "Send Failed.");
    }
    
}