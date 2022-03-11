//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract School {
    struct Class {
        string teacher;
        mapping(string => uint) scores;
    }

    mapping(string => Class) classes;

    function addClass(string calldata classname, string calldata teacher) public {
        classes[classname].teacher = teacher;
    }

    function addStudentScore(string calldata classname, string calldata studentname, uint score) public {
        classes[classname].scores[studentname] = score;
    }

    function getStudentScore(string calldata classname, string calldata studentname) public view returns(uint){
        return classes[classname].scores[studentname];
    }
}