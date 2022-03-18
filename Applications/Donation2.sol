//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
/**
* 1.實況主捐贈實作，模擬觀眾捐贈實況主之行為
* 2.觀眾在實作 donate 時，需指定被捐贈者（streamer）、捐贈者暱稱（nickname）、捐贈金額（value）、以及想說的話（message）
* 3.被捐贈者將（streamer）將收到（event）捐款者訊息
*/
contract Donation {
    event donorInfo(
        address streamer,
        address donor, string nickname, 
        uint value, string message
        );

    function donate(address _streamer, string calldata _nickname, string calldata message) 
    public payable {

        payable(_streamer).transfer(msg.value);
        emit donorInfo(_streamer, msg.sender, _nickname, msg.value, message);
    }
}