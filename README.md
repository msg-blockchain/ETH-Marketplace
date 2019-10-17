# A minimalist Ethereum based Marketplace

**Marketplace:** https://msg-blockchain.github.io/ETH-Marketplace/index.html

**Smart Contract:** https://ropsten.etherscan.io/address/0xf64082e10684885cff685c20bd165fc00b315fd6

**Token Tracker:** https://ropsten.etherscan.io/token/0xf64082e10684885cff685c20bd165fc00b315fd6

## Get started! (with Google Chrome)

1. Install Metamask Extension -> https://metamask.io/
2. Set up a wallet in Metamask
3. Switch from *Ethereum Mainnet* to *Ropsten Testnetwork* in Metamask
4. Get Testnet Ether from Faucet -> https://faucet.metamask.io/ (can be used multiple times)
5. Go to https://msg-blockchain.github.io/ETH-Marketplace/Register.html and register
6. Use the Marketplace

## Documentation

### Ethereum Smart Contract (Solidity)

The Smart Contract contains all functions of the marketplace. In this use case all data is saved on the public Ethereum Testnet Blockchain (Ropsten). This means the data is visible for everyone and everyone can use the marketplace. The fact that all data is saved on-chain (vs off-chain) will lead to longer loading times of the data the more data the marketplace contains (eg. number of users and orders). In a real-life scenario the data would be saved off-chain and only the hashes would be saved on-chain.

### Frontend (CSS/HTML + JS) + web3.js + Metamask

A basic frontend has been created using CSS/HTML and JS. This frontend is connected via web3.js and Metamask to the Ethereum Testnet Blockchain.

**web3.js:** An API that allows to communicate with an Ethereum blockchain via JavaScript. The code is integrated in the frontend and allows for example to trigger a transaction on the blockchain with the click of a button or read data from the blockchain.
docs: https://web3js.readthedocs.io/en/v1.2.1/

**Metamask:** To trigger an action on a blockchain a user needs a Private Key that coud be compared with the password to a bank account, granting complete access to all funds on said account (without the possibility to reverse malicious transactions). Thus the Private Key is a really sensitive information and should be kept secret. Typing it in on a website is not user-friendly (as it consists of 78 symbols or more) and it could expose the Private Key to third parties. Metamask is a secure service that allows the management and use of a users Private Keys without the need of typing them in or revealing them. Metamask is widely used in the Ethereum DApp space (Decentralized Application) and it can be easily integrated in most web browsers as an extension.
docs: https://metamask.github.io/metamask-docs/API_Reference/Ethereum_Provider
