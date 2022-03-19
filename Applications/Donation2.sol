//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
/**
* 1.實況主捐款實作，模擬觀眾捐贈實況主之行為
* 2.觀眾在實作 donate 行為時，需指定被捐贈者（streamer）、捐贈者暱稱（nickname）、捐贈金額（value）、以及想說的話（message）
* 3.被捐贈者將收到捐款者訊息（event）
* 4.每位實況者擁有各自的捐贈者帳本（DonationHistory）可供查詢捐贈者名單、及捐贈金額
*/
contract Donation {
    struct DonorInfo {
        address[] donors;
        mapping(address => uint) amount;
    }
    mapping(address => DonorInfo) DonationHistory;

    event Logdonate(
        address streamer,
        address donor, string nickname, 
        uint value, string message
        );

    function donate(address _streamer, string calldata _nickname, string calldata message) 
    public payable {
        require(msg.value > 0);
        payable(_streamer).transfer(msg.value);

        if( DonationHistory[_streamer].amount[msg.sender] == 0 ) {
            DonationHistory[_streamer].donors.push(msg.sender);
        }
        DonationHistory[_streamer].amount[msg.sender] += msg.value;
        emit Logdonate(_streamer, msg.sender, _nickname, msg.value, message);
    }

    function getDonorList() public view returns(address[] memory) {
        return DonationHistory[msg.sender].donors;
    }

    function getDonateValue(address _donor) public view returns(uint){
        return DonationHistory[msg.sender].amount[_donor];
    }

    event LoglistDonorInfo(address streamer, address donor, uint value);
    function listDonorInfo() public {
        for(uint i=0; i < DonationHistory[msg.sender].donors.length; i++) {
            address _user = DonationHistory[msg.sender].donors[i];
            emit LoglistDonorInfo(msg.sender, _user, DonationHistory[msg.sender].amount[_user]);
        }
    }
}