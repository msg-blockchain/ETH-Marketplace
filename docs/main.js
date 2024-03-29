var abi = [{ "constant": true, "inputs": [], "name": "name", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "userCount", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "totalSupply", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "orderCount", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "decimals", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "uint256", "name": "userId", "type": "uint256" }], "name": "balanceById", "outputs": [{ "internalType": "uint256", "name": "userBalance", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "tokensSold", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "uint256", "name": "_orderNumber", "type": "uint256" }], "name": "fillOrder", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "address", "name": "", "type": "address" }], "name": "balanceOf", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "tokenPrice", "outputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [], "name": "symbol", "outputs": [{ "internalType": "string", "name": "", "type": "string" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "name": "allUsers", "outputs": [{ "internalType": "uint256", "name": "userId", "type": "uint256" }, { "internalType": "string", "name": "name", "type": "string" }, { "internalType": "address", "name": "userAddress", "type": "address" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "address", "name": "_receiver", "type": "address" }, { "internalType": "uint256", "name": "_value", "type": "uint256" }], "name": "transfer", "outputs": [{ "internalType": "bool", "name": "success", "type": "bool" }], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "string", "name": "_name", "type": "string" }], "name": "createNewUser", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "uint256", "name": "index", "type": "uint256" }], "name": "showUser", "outputs": [{ "internalType": "uint256", "name": "userId", "type": "uint256" }, { "internalType": "string", "name": "userName", "type": "string" }, { "internalType": "address", "name": "userAddress", "type": "address" }, { "internalType": "uint256", "name": "userBalance", "type": "uint256" }], "payable": false, "stateMutability": "view", "type": "function" }, { "constant": false, "inputs": [{ "internalType": "string", "name": "_Name", "type": "string" }, { "internalType": "bool", "name": "_Buy", "type": "bool" }, { "internalType": "uint256", "name": "_Price", "type": "uint256" }], "name": "createOrder", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function" }, { "constant": false, "inputs": [], "name": "buyTokens", "outputs": [], "payable": true, "stateMutability": "payable", "type": "function" }, { "constant": true, "inputs": [{ "internalType": "uint256", "name": "", "type": "uint256" }], "name": "allOrders", "outputs": [{ "internalType": "uint256", "name": "orderCreator", "type": "uint256" }, { "internalType": "uint256", "name": "orderId", "type": "uint256" }, { "internalType": "string", "name": "orderName", "type": "string" }, { "internalType": "bool", "name": "buy", "type": "bool" }, { "internalType": "uint256", "name": "orderPrice", "type": "uint256" }, { "internalType": "bool", "name": "active", "type": "bool" }], "payable": false, "stateMutability": "view", "type": "function" }, { "inputs": [], "payable": false, "stateMutability": "nonpayable", "type": "constructor" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "uint256", "name": "userId", "type": "uint256" }, { "indexed": true, "internalType": "string", "name": "name", "type": "string" }, { "indexed": true, "internalType": "address", "name": "userAddress", "type": "address" }], "name": "NewUser", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "internalType": "uint256", "name": "orderCreator", "type": "uint256" }, { "indexed": false, "internalType": "uint256", "name": "orderId", "type": "uint256" }, { "indexed": true, "internalType": "string", "name": "orderName", "type": "string" }, { "indexed": true, "internalType": "bool", "name": "buy", "type": "bool" }, { "indexed": false, "internalType": "uint256", "name": "orderPrice", "type": "uint256" }, { "indexed": true, "internalType": "bool", "name": "active", "type": "bool" }], "name": "NewOrder", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": false, "internalType": "uint256", "name": "orderCreator", "type": "uint256" }, { "indexed": false, "internalType": "uint256", "name": "orderId", "type": "uint256" }, { "indexed": true, "internalType": "string", "name": "orderName", "type": "string" }, { "indexed": true, "internalType": "bool", "name": "buy", "type": "bool" }, { "indexed": false, "internalType": "uint256", "name": "orderPrice", "type": "uint256" }, { "indexed": true, "internalType": "bool", "name": "active", "type": "bool" }], "name": "OrderFilled", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "_from", "type": "address" }, { "indexed": true, "internalType": "address", "name": "_to", "type": "address" }, { "indexed": false, "internalType": "uint256", "name": "_value", "type": "uint256" }], "name": "Transfer", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "_owner", "type": "address" }, { "indexed": true, "internalType": "address", "name": "_spender", "type": "address" }, { "indexed": false, "internalType": "uint256", "name": "_value", "type": "uint256" }], "name": "Approve", "type": "event" }, { "anonymous": false, "inputs": [{ "indexed": true, "internalType": "address", "name": "_buyer", "type": "address" }, { "indexed": false, "internalType": "uint256", "name": "_amount", "type": "uint256" }], "name": "Sell", "type": "event" }];
var contractAddress = '0xF64082e10684885Cff685c20BD165Fc00b315fd6';
ethereum.autoRefreshOnNetworkChange = false;

window.addEventListener('load', async () => {
    // Modern dapp browsers...
    if (window.ethereum) {
        window.web3 = new Web3(ethereum);
        try {
            await ethereum.enable();
            var marketplace = web3.eth.contract(abi).at(contractAddress);
            var user_account = web3.eth.accounts;
            marketplace.balanceOf(user_account, function (error, result) {
                if (!error) {
                    console.log(JSON.stringify(result));
                    var x = (JSON.parse(result) / (10 ** 12)).toLocaleString();
                    $('#balance').html(x);
                }
                else {
                    console.error(error);
                }
            });

            $('#buy_button').click(function () {
                var amount = 0;
                amount = parseInt($('#buy_amount').val());
                var eth_amount = amount * (10 ** 12);
                marketplace.buyTokens({ value: eth_amount, gas: 300000, gasPrice: 40000000000 }, function (error, result) {
                    if (!error) {
                        console.log(JSON.stringify(result));
                        location.reload();
                    }
                    else {
                        console.error(error);
                    }
                });
            });

            marketplace.orderCount(function (error, result) {
                if (!error) {
                    console.log(JSON.stringify(result));
                    var orderCount = JSON.parse(result);
                    var allOrders = [];
                    var table_length = 0;
                    var final_order = orderCount;
                    var order_table = "";
                    var counter = 0;

                    for (i = 0; i < orderCount; i++) {
                        marketplace.allOrders(i, function (error, result) {
                            if (!error) {
                                counter += 1;
                                var order = JSON.stringify(result);
                                order = JSON.parse(order);
                                if (order[5] == true) {
                                    order.splice(0, 1);
                                    allOrders.push(order);
                                    table_length += 1;
                                }
                                var count = 0;
                                if (counter == final_order) {
                                    for (i = 0; i < table_length; i++) {
                                        var recent_name = allOrders[count][1];
                                        var recent_order_type = allOrders[count][2];
                                        if (recent_order_type == true) {
                                            recent_order_type_text = "<div class='sell_order_tag'><span>Sell</span></div>";
                                        }
                                        else {
                                            recent_order_type_text = "<div class='buy_order_tag'><span>Buy</span></div>";
                                        }
                                        var recent_price = parseInt(allOrders[count][3] / (10 ** 12));
                                        var y_pos = count * 85;
                                        var recent_order = "<a><button id='"
                                        recent_order += count.toString();
                                        recent_order += "' class='marketplace_order_box' style='top: ";
                                        recent_order += y_pos.toString();
                                        recent_order += "px;'><div class='marketplace_order_box_text'><span>";
                                        recent_order += recent_name.toString();
                                        recent_order += "</span></div><div class='price_tag'><span>";
                                        recent_order += recent_price.toLocaleString();
                                        recent_order += "</span></div>";
                                        recent_order += recent_order_type_text;
                                        recent_order += "</button></a>";
                                        order_table += recent_order;
                                        $('#orders').html(order_table);
                                        count += 1;
                                    }
                                    $('.marketplace_order_box').click(function () {
                                        var clicked_id = parseInt(this.id)
                                        console.log(clicked_id);
                                        console.log(allOrders);
                                        var clicked_title = allOrders[clicked_id][1];
                                        var clicked_price = parseInt(allOrders[clicked_id][3] / (10 ** 12));
                                        var clicked_type = allOrders[clicked_id][2];
                                        var display_type = "";
                                        if (clicked_type == true) {
                                            display_type = "sell";
                                        }
                                        else {
                                            display_type = "buy";
                                        }
                                        var display_text = "Are you sure you want to ";
                                        display_text += display_type.toString() + " ";
                                        display_text += clicked_title.toString();
                                        display_text += " for ";
                                        display_text += clicked_price.toString();
                                        display_text += " MMC?"
                                        console.log(clicked_id);
                                        if (confirm(display_text)) {
                                            marketplace.fillOrder(allOrders[clicked_id][0], function (error, result) {
                                                if (!error) {
                                                    console.log(JSON.stringify(result));
                                                    location.reload();
                                                }
                                                else {
                                                    console.error(error);
                                                }
                                            });
                                        }
                                    });
                                }
                            }
                            else {
                                console.error(error);
                            }
                        });
                    }
                }
                else {
                    console.error(error);
                }
            });

            $('#create_button').click(function () {
                var order_title = String($('#order_title').val());
                var radio = document.getElementsByName('radio');
                var order_type = radio[0].checked;
                var order_price_input = parseInt($('#order_price').val());
                var order_price = order_price_input * (10 ** 12);
                var create_display_text = "Create order to ";
                if (order_type == true) {
                    var type_display = "buy";
                }
                else {
                    var type_display = "sell";
                }
                create_display_text += type_display + " ";
                create_display_text += order_title.toString() + " for ";
                create_display_text += order_price_input.toString() + " MMC?";

                if (confirm(create_display_text)) {
                    marketplace.createOrder(order_title, order_type, order_price, function (error, result) {
                        if (!error) {
                            console.log(JSON.stringify(result));
                            location.reload();
                        }
                        else {
                            console.error(error);
                        }
                    });
                }
            });

            marketplace.userCount(function (error, result) {
                if (!error) {
                    console.log(JSON.stringify(result));
                    var userCount = JSON.parse(result);

                    for (i = 0; i < userCount; i++) {
                        marketplace.allUsers(i, function (error, result) {
                            if (!error) {
                                console.log(JSON.stringify(result));
                                var user_address = result[2];

                                if (user_account == user_address) {
                                    console.log('User is registered');
                                    if (location == 'https://msg-blockchain.github.io/ETH-Marketplace/Register.html' || location == 'https://msg-blockchain.github.io/ETH-Marketplace/Register_Message.html') {
                                        window.open("https://msg-blockchain.github.io/ETH-Marketplace/index.html", "_self");
                                    }
                                }
                                else if (i == (userCount - 1)) {
                                    console.log('User is not yet registered');
                                    if (location != 'https://msg-blockchain.github.io/ETH-Marketplace/Register.html' && location != 'https://msg-blockchain.github.io/ETH-Marketplace/Register_Message.html') {
                                        window.open("https://msg-blockchain.github.io/ETH-Marketplace/Register.html", "_self");
                                    }
                                }
                            }
                            else {
                                console.error(error);
                            }
                        });
                    }
                }
                else {
                    console.error(error);
                }
            });

            $('#register_button').click(function () {
                var user_name = String($('#user_name_input').val());
                marketplace.createNewUser(user_name, function (error, result) {
                    if (!error) {
                        console.log(JSON.stringify(result));
                    }
                    else {
                        console.error(error);
                    }
                });
            });

        } catch (error) {
            // User denied account access...
        }
    }
    // Legacy dapp browsers...
    else if (window.web3) {
        window.web3 = new Web3(web3.currentProvider);
        alert("Please install Metamask Extension");
    }
    // Non-dapp browsers...
    else {
        console.log('Non-Ethereum browser detected. You should consider trying MetaMask!');
        alert("Please install Metamask Extension");
    }
});



