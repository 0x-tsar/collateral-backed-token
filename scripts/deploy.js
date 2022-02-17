// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
// const hre = require("hardhat");
const { ethers } = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  // We get the contract to deploy
  const Dai = await ethers.getContractFactory("Dai");
  const dai = await Dai.deploy();
  await Dai.deployed();
  console.log("Dai deployed to:", dai.address);

  const CollateralBackedToken = await ethers.getContractFactory(
    "CollateralBackedToken"
  );
  const collateralBackedToken = await CollateralBackedToken.deploy(dai.address);
  await collateralBackedToken.deployed();
  console.log(
    "CollateralBackedToken deployed to:",
    collateralBackedToken.address
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
