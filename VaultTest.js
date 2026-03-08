const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("YieldVault", function () {
  it("Should mint shares on deposit", async function () {
    const [owner, user] = await ethers.getSigners();
    
    // Mock Token setup
    const Token = await ethers.getContractFactory("MyToken"); // From Repo 1
    const token = await Token.deploy("Mock", "MCK", 1000000);
    
    const Vault = await ethers.getContractFactory("YieldVault");
    const vault = await Vault.deploy(await token.getAddress(), "VaultToken", "vMCK");

    await token.approve(await vault.getAddress(), ethers.parseEther("100"));
    await vault.deposit(ethers.parseEther("100"));

    expect(await vault.balanceOf(owner.address)).to.equal(ethers.parseEther("100"));
  });
});
