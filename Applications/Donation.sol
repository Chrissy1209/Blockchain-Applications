//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
/**
* 1.捐款實作
* 2.限定最低捐款金額
* 3.儲存捐贈者名單及捐贈金額
*/
contract Donation {
    mapping(address => uint) public ledger;
    mapping(address => bool) public donors;
    address[] public donorList;

    function isDonor(address addr) public view returns(bool) {
        return donors[addr];
    }

    function donate() public payable {
        if(msg.value >= 0.5 ether) {
            if(!isDonor(msg.sender)) {
                donors[msg.sender] = true;
                donorList.push(msg.sender);
            }

            ledger[msg.sender] += msg.value;
        }
        else revert("< 0.5 ETH.");
    }

    function withdraw(uint amount) public {
        payable(msg.sender).transfer(amount * 1 ether);
    }
}