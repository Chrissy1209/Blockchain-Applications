//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./ERC20.sol";
import "../Library/SafeMath.sol";

contract Mintable is ERC20 {
    using SafeMath for uint256;

    address private owner;
    mapping(address => bool) minters;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier onlyMinter() {
        require(minters[msg.sender]);
        _;
    }
    function mintable(address addr) public onlyOwner returns(bool) {
        minters[addr] = true;
        return true;
    }

    function mint(address to, uint amount) public onlyMinter returns(bool) {
        // add `_totalsupply`.
        _totalSupply = _totalSupply.Add(amount);
        // Move `amount` tokens from `address(0)` to `to`.
        _balanses[to] = _balanses[to].Add(amount);
        emit Transfer(address(0), to, amount);
        return true;
    }
}