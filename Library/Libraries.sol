//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

library Set {
    struct Data {
        mapping(uint => bool) data;
    }
    function Insert(Data storage self, uint key) public returns(bool) {
        if(self.data[key]) return false;
        self.data[key] = true;
        return true;
    }

    function Remove(Data storage self, uint key) public returns(bool) {
        if(!self.data[key]) return false;
        self.data[key] = false;
        return true;
    }

    function Contain(Data storage self, uint key) public view returns(bool) {
        return self.data[key];
    }
}

contract Libraries {
    Set.Data set;
    function insert(uint key) public returns(bool) {
        return Set.Insert(set, key);
    }
    function remove(uint key) public returns(bool) {
        return Set.Remove(set, key);
    }
    function contain(uint key) public view returns(bool) {
        return Set.Contain(set, key);
    }
}