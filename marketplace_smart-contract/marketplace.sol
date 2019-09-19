//Set the Version of Solidity that is used
pragma solidity 0.5.11;

/**TODO
 * new function: show list of all Users
 * add item list / "inventory" for Users
 * Error Messages
 */

//Smart Contract for Marketplace
contract Marketplace {
    
    //Constructor wil be automatcally excetcuted when Contract is called
    constructor() public {
        //Send all the Market Currency to the Contract Address
        balanceOf[contractAddress] = totalSupply;
        //Log this Transfer to the Bockchain
        emit Transfer(address(0), contractAddress, totalSupply);
    }

//User related Variables and Functions

    //Initial Coins a User gets when creating an Account on the Marketplace
    uint initialCoins = 500;

    //Variable counting Users
    uint public userCount = 0;

    //User Instance
    struct User {
        //User ID
        uint userId;
        //User Name
        string name;
        //User Address
        address userAddress;
    }

    //Mapping of all Users
    mapping(uint => User) public allUsers;
    
    //Show a Users balance by his ID
    function balanceById(uint userId) public view returns (uint) {
        //Find User Address by User ID
        address _address = allUsers[userId].userAddress;
        return getBalance(_address);
    }

    //Create a new User, every User has to be created from a different Address
    function createNewUser(string memory _name) public{
        //Address of User Creator
        address senderAddress = msg.sender;
        bool exists = false;
        //Check if User already exists
        for (uint i = 0; i < userCount; i++) {
            if (allUsers[i].userAddress == senderAddress) {
                exists = true;
            }
        }
        require(exists == false, "User Creation failed because Address is already used.");
        //Create Entry in allUsers
        allUsers[userCount] = User(userCount, _name, senderAddress);
        //Create Entry in MarketCurrency Smart Contract
        transferFromContract(msg.sender, initialCoins);
        userCount += 1;
    }
    
    //Show a User by User ID
    function showUser(uint index) public view returns (uint, string memory, address, uint) {
        return (allUsers[index].userId, allUsers[index].name, allUsers[index].userAddress, balanceOf[allUsers[index].userAddress]);
    }

    //Get User ID by Address
    function getUserIdByAddress() public view returns (uint) {
        for (uint i = 0; i < userCount; i++) {
            if (allUsers[i].userAddress == msg.sender) {
                return (i);
            }
        }
    }

//Order related Variables and Functions

    //Variable counting Orders
    uint public orderCount = 0;

    //Order Instance
    struct Order {
        //User ID of Order Creator
        uint orderCreator;
        //Order ID
        uint orderId;
        //Auction Name
        string orderName;
        //Order Type (Buy or Sell), if True -> Buy Order, if False -> Sell Order
        bool buy;
        //Order Price
        uint orderPrice;
        //Order Status, becomes inactive when filled
        bool active;
    }

    //Mapping of all Orders
    mapping(uint => Order) public allOrders;

    //Create Order
    function createOrder(string memory _Name, bool _Buy, uint _Price) public {
        uint orderCreator = getUserIdByAddress();
        //Create Entry in List of all Orders
        allOrders[orderCount] = Order(orderCreator, orderCount, _Name, _Buy, _Price, true);
        orderCount += 1;
    }
    
    //Show a specific Order
    function showOrder(uint _orderNumber) public view returns (string memory, string memory, uint, string memory){
        string memory orderType;
        if (allOrders[_orderNumber].buy == true) {
            orderType = "Sell Order";
        }
        else {
            orderType = "Buy Order";
        }
        string memory orderActive;
        if (allOrders[_orderNumber].active == true) {
            orderActive = "Order is active";
        }
        else {
            orderActive = "Order is inactive";
        }
        return (orderType, allOrders[_orderNumber].orderName, allOrders[_orderNumber].orderPrice, orderActive);
    }
    
    //Fill a specific Order
    function fillOrder(uint _orderNumber) public {
        //Check if Order is active
        require(allOrders[_orderNumber].active == true, "Order has already been filled!");
        //Check if OrderCreator and OrderFiller are the same Person
        uint orderCreator = allOrders[_orderNumber].orderCreator;
        uint orderFiller = getUserIdByAddress();
        require(orderCreator != orderFiller, "You cannot fill your own Order!");
        //Check if Order Creator or Order Filler has enough Funds
        uint costs = allOrders[_orderNumber].orderPrice;
        //Check if Buy or Sell Order
        bool typeBuy = allOrders[_orderNumber].buy;
        if (typeBuy == true) {
            require(getBalance(allUsers[orderCreator].userAddress) >= costs, "Order Creator has insufficient Funds!");
            //Send Funds from Order Creator to Order Filler
            transferFrom(allUsers[orderCreator].userAddress, allUsers[orderFiller].userAddress, costs);
            }
        else {
            require(getBalance(allUsers[orderFiller].userAddress) >= costs, "Order Filler has insufficient Funds!");
            //Send Funds from Order Filler to Order Creator
            transferFrom(allUsers[orderFiller].userAddress, allUsers[orderCreator].userAddress, costs);
        }
        allOrders[_orderNumber].active == false;
    }
    
//Market Currency related Variables and Functions
    
    //Total Number of Tokens
    uint public totalSupply = 1000000;
    //Name of Token
    string public name = "Market Token";
    //Symbol of the Token
    string public symbol = "MT";

    //Token Transfer Event
    event Transfer(address indexed _from, address indexed _to, uint _value);

    //Approve Event -> Allow someone to send Tokens from your Address
    event Approve(address indexed _owner, address indexed _spender, uint _value);

    //Addresses and associated Balances
    mapping(address => uint) public balanceOf;

    //Addresses and associated Allowances
    mapping(address => mapping(address => uint)) public allowance;
    
    //Contract address
    address contractAddress = address(this);

    //Transfer Tokens from Contract
    function transferFromContract(address _receiver, uint _value) public returns (bool success) {
        require(balanceOf[contractAddress] >= _value);
        balanceOf[contractAddress] -= _value;
        balanceOf[_receiver] += _value;
        emit Transfer(contractAddress, _receiver, _value);
        return true;
    }
    
    //Transfer Tokens to Someone
    function transfer(address _receiver, uint _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_receiver] += _value;
        emit Transfer(msg.sender, _receiver, _value);
        return true;
    }

    //Approve a _Spender to send a specific _Value from your Address
    function approve(address _spender, uint _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approve(msg.sender, _spender, _value);
        return true;
    }

    //Transfer Tokens from one Address to another Address
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        //require(_value <= allowance[_from][msg.sender]); Not yet implemented
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    //Check Balance of an Address
    function getBalance(address _checkAddress) public view returns (uint) {
        return balanceOf[_checkAddress];
    }

    //Assets-----------------------------------------------------------------------------------

    //Name of Asset
    string public AssetName;

    //Counting Assets
    uint public AssetCounter = 0;

    //Token Transfer Event
    event AssetTransfer(address indexed _from, address indexed _to, uint _value);

    //Approve Event -> Allow someone to send Tokens from your Address
    event AssetApprove(address indexed _owner, address indexed _spender, uint _value);

    //Asset IDs and Names
    mapping(uint => string) AssetList;

    //Addresses and associated Assets and Balances
    mapping(address => mapping(uint => uint)) public AssetBalanceOf;

    //Addresses and associated Allowances
    mapping(address => mapping(address => uint)) public assetAllowance;

//Functions
    /*
    //IN PROGRESS==============================================

    //Create Asset
    function createAsset(string memory _Name, string memory _Symbol) public {
        name = _Name;
        symbol = _Symbol;
        balanceOf[contractAddress] = totalSupply;
        emit Transfer(address(0), contractAddress, totalSupply);
    }

    //Transfer Asset from Contract
    function transferAssetFromContract(address _receiver, uint _value) public returns (bool success) {
        require(balanceOf[contractAddress] >= _value);
        balanceOf[contractAddress] -= _value;
        balanceOf[_receiver] += _value;
        emit Transfer(contractAddress, _receiver, _value);
        return true;
    }
    
    //Transfer Asset to Someone
    function transferAsset(address _receiver, uint _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_receiver] += _value;
        emit Transfer(msg.sender, _receiver, _value);
        return true;
    }

    //Approve a _Spender to send a specific Asset _Value from your Address
    function approveAsset(address _spender, uint _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approve(msg.sender, _spender, _value);
        return true;
    }

    //Transfer Asset from one Address to another Address
    function transferAssetFrom(address _from, address _to, uint _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
    */
}