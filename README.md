# Automated Yield Vault

This repository contains a high-performance yield optimization contract. It is designed to accept deposits in a specific asset, deploy them into a yield-generating strategy, and periodically "harvest" and reinvest rewards to maximize APY through compounding.

## Strategy Overview
The vault follows a "Strategy-Controller-Vault" pattern. This specific implementation focuses on a single-asset staking strategy that compounds rewards back into the underlying asset via a swap router (e.g., Uniswap or PancakeSwap).



## Core Logic
* **Deposit**: Users receive "Vault Shares" representing their claim on the pool.
* **Harvest**: An automated bot or keeper calls the harvest function to claim rewards, swap them for the base asset, and re-stake.
* **Withdraw**: Shares are burned, and the user receives their principal plus a portion of the compounded yield.

## Deployment
1. Set the `asset` address (e.g., USDC or WETH).
2. Set the `strategy` address.
3. Deploy to a network with high liquidity (Ethereum, Arbitrum, or Polygon).

## License
MIT
