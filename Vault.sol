// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract YieldVault is ERC20, Ownable {
    IERC20 public immutable asset;

    constructor(address _asset, string memory _name, string memory _symbol) 
        ERC20(_name, _symbol) 
        Ownable(msg.sender) 
    {
        asset = IERC20(_asset);
    }

    function deposit(uint256 _amount) external {
        uint256 totalAsset = totalAssets();
        uint256 totalShares = totalSupply();

        uint256 shares;
        if (totalShares == 0) {
            shares = _amount;
        } else {
            shares = (_amount * totalShares) / totalAsset;
        }

        asset.transferFrom(msg.sender, address(this), _amount);
        _mint(msg.sender, shares);
    }

    function withdraw(uint256 _shares) external {
        uint256 totalAsset = totalAssets();
        uint256 totalShares = totalSupply();

        uint256 amount = (_shares * totalAsset) / totalShares;

        _burn(msg.sender, _shares);
        asset.transfer(msg.sender, amount);
    }

    function totalAssets() public view returns (uint256) {
        return asset.balanceOf(address(this));
    }
}
