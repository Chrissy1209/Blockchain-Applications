//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "../Library/SafeMath.sol";
import "./ERC20.sol";

contract Burnable is ERC20 {
    using SafeMath for uint256;

}