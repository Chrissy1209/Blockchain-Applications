//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
/**
* 1.鏈上捐款系統：模擬實際捐款之行為，提供通知、紀錄、查詢等動作
* 2.捐款者在實作 donate 行為時，需指定被捐贈者（streamer）、捐款者暱稱（nickname）、捐款金額（msg.value）、以及想說的話（message）
* 3.被捐贈者將以 event 形式收到捐款者訊息
* 4.每位被捐贈者擁有各自的捐款者帳本（DonationHistory）可供查詢捐款者名單、及捐款金額
*/
contract DonationServer {
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