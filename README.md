# A minimalist Ethereum based Marketplace

**Marketplace:** https://msg-blockchain.github.io/ETH-Marketplace/index.html

**Smart Contract:** https://ropsten.etherscan.io/address/0xf64082e10684885cff685c20bd165fc00b315fd6

**Token Tracker:** https://ropsten.etherscan.io/token/0xf64082e10684885cff685c20bd165fc00b315fd6

## Get started! (with Google Chrome)

1. Install the Metamask extension -> https://metamask.io/
2. Set up a wallet in Metamask
3. Switch from *Ethereum Mainnet* to *Ropsten Testnetwork* in Metamask
4. Get Testnet Ether from the Faucet (cick on *request 1 ether from faucet*) -> https://faucet.metamask.io/ (can be used multiple times)
5. Go to https://msg-blockchain.github.io/ETH-Marketplace/Register.html and sign up by typing in your name, clicking the *confirm* button and confirming the transaction in the Metamask popup window
6. Use the Marketplace (e.g. buy MegaMarket Coins and buy / sell items)

## Documentation

### Ethereum Smart Contract (Solidity)

The Smart Contract contains all functions of the marketplace. In this use case all data is saved on the public Ethereum Testnet Blockchain (Ropsten). This means the data is visible for everyone and everyone can use the marketplace. The fact that all data is saved on-chain (vs off-chain) will lead to longer loading times of the data the more data the marketplace contains (eg. number of users and orders). Because of the high costs of storing data on a blockchain (at least on public blockchains) and the long loading times when retrieving data from it, in a real-life scenario the data would be saved off-chain and only the hashes of the data would be saved on-chain.

### Frontend (CSS/HTML + JS) + web3.js + Metamask

A basic frontend has been created using CSS/HTML and JavaScript. This frontend is connected via the web3.js library and Metamask to the Ethereum Testnet Blockchain (Ropsten).

**web3.js:** web3.js provides an API that allows to communicate with an Ethereum blockchain via JavaScript. In this use case the code is implemented in the frontend and allows for example to trigger a transaction on the blockchain with the click of a button or read data from the blockchain and display it on the frontend.

docs: https://web3js.readthedocs.io/en/v1.2.1/

**Metamask:** To trigger an action on a blockchain a user needs a Private Key that could be compared to the password to a bank account, granting complete access to all funds on said account (without the possibility to reverse malicious transactions). Thus the Private Key is a really sensitive information and should be kept secret. Typing it in on a website is not user-friendly (as it consists of 78 symbols or more) and it could expose the Private Key to third parties. Metamask is a secure service that allows the management and use of a users Private Keys without the need of typing them in or revealing them to anybody. Metamask is widely used in the Ethereum DApp (Decentralized Application) space and it can be easily integrated into most web browsers as an extension.

docs: https://metamask.github.io/metamask-docs/API_Reference/Ethereum_Provider
