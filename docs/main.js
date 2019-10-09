if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
}
else {
    web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
};

web3.eth.defaultAccount = web3.eth.accounts[0];

var marketplaceContract = web3.eth.contract([{ "constant": true, "inputs": [], "name": "name", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "userCount", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "totalSupply", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "orderCount", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "decimals", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "uint256", "name": "userId", "type": "uint256" }], "name": "balanceById", "outputs": [{ "internalType": "uint256", "name": "userBalance", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "tokensSold", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "uint256", "name": "_orderNumber", "type": "uint256" }], "name": "fillOrder", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "address", "name": "", "type": "address" }], "name": "balanceOf", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "tokenPrice", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "symbol", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "name": "allUsers", "outputs": [{ "internalType": "uint256", "name": "userId", "type": "uint256" }, { "internalType": "string", "name": "name", "type": "string" }, { "internalType": "address", "name": "userAddress", "type": "address" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "_receiver", "type": "address" }, { "internalType": "uint256", "name": "_value", "type": "uint256" }], "name": "transfer", "outputs": [{ "internalType": "bool", "name": "success", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "string", "name": "_name", "type": "string" }], "name": "createNewUser", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "uint256", "name": "index", "type": "uint256" }], "name": "showUser", "outputs": [{ "internalType": "uint256", "name": "userId", "type": "uint256" }, { "internalType": "string", "name": "userName", "type": "string" }, { "internalType": "address", "name": "userAddress", "type": "address" }, { "internalType": "uint256", "name": "userBalance", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "string", "name": "_Name", "type": "string" }, { "internalType": "bool", "name": "_Buy", "type": "bool" }, { "internalType": "uint256", "name": "_Price", "type": "uint256" }], "name": "createOrder", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [], "name": "buyTokens", "outputs": [], "payable": true, "stateMutability": "payable", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "name": "allOrders", "outputs": [{ "internalType": "uint256", "name": "orderCreator", "type": "uint256" }, { "internalType": "uint256", "name": "orderId", "type": "uint256" }, { "internalType": "string", "name": "orderName", "type": "string" }, { "internalType": "bool", "name": "buy", "type": "bool" }, { "internalType": "uint256", "name": "orderPrice", "type": "uint256" }, { "internalType": "bool", "name": "active", "type": "bool" }], "payable": false, "stateMutability": "view", "type": "function" }, { "inputs": [], "payable": false, "stateMutability": "nonpayable", "type": "constructor" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "uint256", "name": "userId", "type": "uint256" }, { "indexed": true, "internalType": "string", "name": "name", "type": "string" }, { "indexed": true, "internalType": "address", "name": "userAddress", "type": "address" }], "name": "NewUser", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "internalType": "uint256", "name": "orderCreator", "type": "uint256" }, { "indexed": false, "internalType": "uint256", "name": "orderId", "type": "uint256" }, { "indexed": true, "internalType": "string", "name": "orderName", "type": "string" }, { "indexed": true, "internalType": "bool", "name": "buy", "type": "bool" }, { "indexed": false, "internalType": "uint256", "name": "orderPrice", "type": "uint256" }, { "indexed": true, "internalType": "bool", "name": "active", "type": "bool" }], "name": "NewOrder", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "internalType": "uint256", "name": "orderCreator", "type": "uint256" }, { "indexed": false, "internalType": "uint256", "name": "orderId", "type": "uint256" }, { "indexed": true, "internalType": "string", "name": "orderName", "type": "string" }, { "indexed": true, "internalType": "bool", "name": "buy", "type": "bool" }, { "indexed": false, "internalType": "uint256", "name": "orderPrice", "type": "uint256" }, { "indexed": true, "internalType": "bool", "name": "active", "type": "bool" }], "name": "OrderFilled", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "_from", "type": "address" }, { "indexed": true, "internalType": "address", "name": "_to", "type": "address" }, { "indexed": false, "internalType": "uint256", "name": "_value", "type": "uint256" }], "name": "Transfer", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "_owner", "type": "address" }, { "indexed": true, "internalType": "address", "name": "_spender", "type": "address" }, { "indexed": false, "internalType": "uint256", "name": "_value", "type": "uint256" }], "name": "Approve", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "_buyer", "type": "address" }, { "indexed": false, "internalType": "uint256", "name": "_amount", "type": "uint256" }], "name": "Sell", "type": "event" }]);

var Marketplace = marketplaceContract.at('0xF64082e10684885Cff685c20BD165Fc00b315fd6');

/* web3.version.getNetwork((err, netId) => {
    switch (netId) {
      case "1":
        console.log('This is mainnet')
        break
      case "2":
        console.log('This is the deprecated Morden test network.')
        break
      case "3":
        console.log('This is the ropsten test network.')
        break
      case "4":
        console.log('This is the Rinkeby test network.')
        break
      case "42":
        console.log('This is the Kovan test network.')
        break
      default:
        console.log('This is an unknown network.')
    }
}); */

Marketplace.symbol(function (error, result) {
    if (!error) {
        console.log(result);
    }
    else {
        console.error(error);
    }
});

//Get User Address
var user_account = web3.eth.accounts;
console.log(user_account);

var user_balance = Marketplace.balanceOf(user_account, function (error, result) {
    if (!error) {
        console.log(result);
        x = JSON.stringify(result);
        return x;
    }
    else {
        console.error(error);
    }
});

console.log(user_balance);