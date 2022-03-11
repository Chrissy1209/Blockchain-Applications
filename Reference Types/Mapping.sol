//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract StudentScores {
    mapping(string => uint) scores;
    string[] public names;

    function addScore(string memory name, uint score) public {
        scores[name] = score;
        names.push(name);
    }

    function getScore(string memory name) public view returns(uint) {
        return scores[name];
    }

    function clear() public {
        for(uint i=0; i<names.length; i++){
            delete scores[names[i]];
        }
    }
}