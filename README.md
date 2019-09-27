# An Ethereum based minimalist Marketplace
Functionality: Create Users, create Orders, fill Orders, buy MegaMarket Coins (MMC) with Ethereum

## How to interact with the Contract

1. Install Metamask Extension -> https://metamask.io/
2. Set up a Wallet
3. Switch from "Ethereum Mainnet" to "Ropsten Testnetwork" in MetaMask
4. Get Testnet Ether from Faucet -> https://faucet.metamask.io/
5. Go to http://remix.ethereum.org
   1. Under "Import from" chose "GitHub" and enter "https://github.com/msg-blockchain/poc-marketplace/blob/master/marketplace_smart-contract/marketplace.sol"
   2. Choose "marketplace.sol" in the file explorer
   3. Under "Deploy and run transactions" on the left set "Environment" to "Injected Web3" and connect to MetaMask
   4. Set "At Address" to "0xFC519D229bC747fb3477D21c675CC8AA8b88b0D4" and confirm
   5. Unfold Contract on the left to see all Functions and interact with the Contract

### Recommended Actions:

1. Create Account with "createNewUser" Function
2. Buy MegaMarket Coins with "buyTokens" Function (Amount of ETH has to be entered in "Value")
3. Create an Order with "createOrder" Function ("Buy" has to be "true" or "false")
4. Fill an Order with the "fillOrder" Function after looking for one with the "allOrders"


Contract: https://ropsten.etherscan.io/address/0xfc519d229bc747fb3477d21c675cc8aa8b88b0d4

ERC20 Token: https://ropsten.etherscan.io/token/0xfc519d229bc747fb3477d21c675cc8aa8b88b0d4
