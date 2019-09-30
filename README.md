# A minimalist Ethereum based Marketplace
Functionality: Create Users, create Orders, fill Orders, buy MegaMarket Coins (MMC) with Ethereum etc.

## How to interact with the Contract

1. Install Metamask Extension -> https://metamask.io/
2. Set up a Wallet
3. Switch from *Ethereum Mainnet* to *Ropsten Testnetwork* in MetaMask
4. Get Testnet Ether from Faucet -> https://faucet.metamask.io/ (can be used multiple times)
5. Go to http://remix.ethereum.org
   1. Under "Import from" choose *GitHub* and enter *https://github.com/msg-blockchain/poc-marketplace/blob/master/marketplace_smart-contract/marketplace.sol*
   2. Select "marketplace.sol" in the file explorer (unfold all folders under "Github")
   3. Under "Deploy and run transactions" in the left sidebar set *Environment" to "Injected Web3* and connect to MetaMask
   4. Set "At Address" to *0xF64082e10684885Cff685c20BD165Fc00b315fd6* and confirm by clicking "At Address"
   5. Unfold Contract on the left to see all Functions and interact with the Contract by using the input fields next to the red and orange buttons

### Recommended Actions

1. Create a new Account with "createNewUser" Function (you will get 5000 MMC for free)
2. Buy MegaMarket Coins with "buyTokens" Function (Amount of ETH has to be entered in "Value", switch from *wei* to *ether*))
3. Create an Order with "createOrder" Function ("Buy" has to be *true* or *false*)
4. Fill an Order with the "fillOrder" Function after looking for one with the "allOrders"
5. Try out whatever you want, you cannot break anything! (except the Smart Contract was written badly)

### Further Information

- Function button colors in Remix:
  - *Red*: Payable functions (send ETH with the transaction)
  - *Orange*: State changing functions (adding data to the blockchain)
  - *Blue*: Calls (that only show information form the Bockchain and have no costs)
- When Creating an Order: to set a price of 500 MMC you have to write *500000000000000* (add 12 zeros)
- You can add the MegaMarket Coin to MetaMask with the "Add Token" button and inserting the contract address *0xf64082e10684885cff685c20bd165fc00b315fd6*
- Read the Smart Contract, see the relevant transactions, check the token distribution etc. with the links below

**Smart Contract:** https://ropsten.etherscan.io/address/0xf64082e10684885cff685c20bd165fc00b315fd6

**ERC20 Token:** https://ropsten.etherscan.io/token/0xf64082e10684885cff685c20bd165fc00b315fd6
