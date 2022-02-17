//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract CollateralBackedToken is ERC20 {
  IERC20 public collateral;
  uint256 public price = 1;

  constructor(address _collateral) ERC20("COLLATERAL BACKED TOKEN", "CBT") {
    collateral = IERC20(_collateral);
  }

  function deposit(uint256 collateralAmount) public {
    //allow first
    collateral.transferFrom(msg.sender, address(this), collateralAmount);
    _mint(msg.sender, collateralAmount * price);
  }

  function withdraw(uint256 tokenAmount) public {
    require(balanceOf(msg.sender) >= tokenAmount, "Insuficient Balance");
    _burn(msg.sender, tokenAmount);
    collateral.transfer(msg.sender, tokenAmount / price);
  }
}
