//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./libraries.sol";

contract Using {
    using Set for Set.Data;
    Set.Data mySet;

    function insert(uint key) public returns(bool) {
        return mySet.Insert(key);
        // return Set.Insert(set, key);
    }
    function remove(uint key) public returns(bool) {
        return mySet.Remove(key);
        // return Set.Remove(set, key);
    }
    function contain(uint key) public view returns(bool) {
        return mySet.Contain(key);
        // return Set.Contain(set, key);
    }
}