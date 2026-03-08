// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IStrategy {
    function deposit() external;
    function withdraw(uint256 amount) external;
    function harvest() external;
    function balanceOf() external view returns (uint256);
}
