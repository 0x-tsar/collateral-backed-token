//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Dai is ERC20 {
  //
  constructor() ERC20("DAI STABLE COIN", "DAI") {
    _mint(msg.sender, 3 * 10**18);
  }
}
