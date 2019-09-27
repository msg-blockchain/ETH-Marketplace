# An Ethereum based minimalist Marketplace

## How to interact with the Contract

1. Install Metamask Extension -> https://metamask.io/
2. Set up a Wallet
3. Switch to Ropsten Testnetwork in MetaMask
4. Get Testnet Ether from Faucet -> https://faucet.ropsten.be/
5. Go to http://remix.ethereum.org
5.1 Under "Deploy and run transactions" set "Environment" to "injected Web3" and connect to MetaMask
5.2 Set "At Address" to "0x4c33d8Ea707c4b65Db043898C602CeD0640e1fC2" and confirm
5.3 Unfold Contract on the left to see all Functions and interact with the Contract

### Recommended Actions:

1. Create Account with "createNewUser" Function
2. Buy MegaMarket Coins with "buyTokens" Function (Amount of ETH has to be entered in "Value")
3. Create an Order with "createOrder" Function ("Buy" has to be "true" or "false")
4. Fill an Order with the "fillOrder" Function after looking for one with the "allOrders"

Contract: https://ropsten.etherscan.io/address/0xfc519d229bc747fb3477d21c675cc8aa8b88b0d4
ERC20 Token: https://ropsten.etherscan.io/token/0xfc519d229bc747fb3477d21c675cc8aa8b88b0d4
