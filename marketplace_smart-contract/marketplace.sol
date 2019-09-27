//Version of Solidity that is used
pragma solidity 0.5.11;

/**
 * @author Jay-B
 * @title A simple Marketplace
 * Allows to create Buy and Sell Orders and fill them.
 * Further it is possible to buy MegaMarket Coins (which are necessary for trading) with Ethereum.
 */
contract Marketplace {

    /*
    Constructor wil be automatically excecuted when Contract is deployed
    */
    constructor () public {
        //Send all Coins to the Contract Address
        balanceOf[contractAddress] = totalSupply;
    }

    //Initial Coins a User gets when creating an Account on the Marketplace
    uint initialCoins = 5000000000000000;

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
    mapping (uint => User) public allUsers;

    /*
    Create a new User, every User has to be created from a different Address
    */
    function createNewUser(string memory _name) public {
        //Address of User Creator
        address senderAddress = msg.sender;
        //Check if a User has already been created from this Address
        bool exists = false;
        for (uint i = 0; i < userCount; i++) {
            if (allUsers[i].userAddress == senderAddress) {
                exists = true;
            }
        }
        require(exists == false, "User Creation failed because Address is already used.");
        //Create Entry in allUsers
        allUsers[userCount] = User(userCount, _name, senderAddress);
        //Send initial Tokens to User
        transferFromContract(msg.sender, initialCoins);
        emit NewUser(userCount, _name, senderAddress);
        userCount += 1;
    }

    /*
    Show User balance by User ID
    */
    function balanceById(uint userId) public view returns (uint userBalance) {
        address _address = allUsers[userId].userAddress;
        return balanceOf[_address];
    }

    /*
    Show a User Instance and its Coins by User ID
    */
    function showUser(uint index) public view returns (uint userId, string memory userName, address userAddress, uint userBalance) {
        return (allUsers[index].userId, allUsers[index].name, allUsers[index].userAddress, balanceOf[allUsers[index].userAddress]);
    }

    /*
    Show User ID by Address
    */
    function getUserIdByAddress() private view returns (uint userId) {
        for (uint i = 0; i < userCount; i++) {
            if (allUsers[i].userAddress == msg.sender) {
                return (i);
            }
        }
    }

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
        //Order Type (Buy / Sell), if true -> Buy Order, if false -> Sell Order
        bool buy;
        //Order Price
        uint orderPrice;
        //Order Status, becomes inactive when filled
        bool active;
    }

    //Mapping of all Orders
    mapping (uint => Order) public allOrders;

    /*
    Create Order
    */
    function createOrder(string memory _Name, bool _Buy, uint _Price) public {
        uint orderCreator = getUserIdByAddress();
        //If Buy Order, check if User has enough Coins and lock the Amount
        if (_Buy == true) {
          require(balanceOf[msg.sender] >= _Price, "Not enough Coins to create Order!");
          require(balanceOf[msg.sender] - allowance[msg.sender][contractAddress] >= _Price, "Already too much Coins in other Orders!");
          approve(contractAddress, _Price);
        }
        //Create Entry in List of all Orders
        allOrders[orderCount] = Order(orderCreator, orderCount, _Name, _Buy, _Price, true);
        emit NewOrder(orderCreator, orderCount, _Name, _Buy, _Price, true);
        orderCount += 1;
    }

    /*
    Fill an Order
    */
    function fillOrder(uint _orderNumber) public {
        //Check if Order is active
        require(allOrders[_orderNumber].active == true, "Order has already been filled!");
        //Assure that OrderCreator and OrderFiller are not the same Person
        uint orderCreator = allOrders[_orderNumber].orderCreator;
        uint orderFiller = getUserIdByAddress();
        require(orderCreator != orderFiller, "You cannot fill your own Order!");
        uint costs = allOrders[_orderNumber].orderPrice;
        //Check if Buy or Sell Order
        bool typeBuy = allOrders[_orderNumber].buy;
        if (typeBuy == true) {
            //Send Coins from Order Creator to Order Filler
            transferFrom(allUsers[orderCreator].userAddress, contractAddress, costs);
            allowance[allUsers[orderCreator].userAddress][contractAddress] -= costs;
            transferFromContract(msg.sender, costs);
            }
        else {
            //Check if OrderFiller has enough Coins
            require(balanceOf[allUsers[orderFiller].userAddress] >= costs, "Order Filler has insufficient Coins!");
            require(balanceOf[msg.sender] - allowance[msg.sender][contractAddress] >= costs, "Order Filler already has too much Coins in other Orders!");
            //Send Coins from OrderFiller to OrderCreator
            transferFrom(allUsers[orderFiller].userAddress, contractAddress, costs);
            transferFromContract(allUsers[orderCreator].userAddress, costs);
        }
        //Set Order inactive
        allOrders[_orderNumber].active = false;
        emit OrderFilled(orderCreator, orderCount, allOrders[_orderNumber].orderName, typeBuy, costs, false);
    }

    //New User Event
    event NewUser(uint indexed userId, string indexed name, address indexed userAddress);
    
    //New Order Event
    event NewOrder(uint orderCreator, uint orderId, string indexed orderName, bool indexed buy, uint orderPrice, bool indexed active);
    
    //Order Filled Event
    event OrderFilled(uint orderCreator, uint orderId, string indexed orderName, bool indexed buy, uint  orderPrice, bool indexed active);
    
//Market Currency related Variables, Functions and Events
    
    //Total Number of Tokens (considering Decimals: 1,000,000,000,000)
    uint public totalSupply = 1000000000000000000000000;
    
    //Token Decimals, only relevant for display
    uint decimals = 12;
    
    //Number of Tokens sold
    uint public tokensSold = 0;
    
    //Token Price, Wei / Token (not considering Decimals)
    uint tokenPrice = 1;
    
    //Name of Token
    string public name = "MegaMarket Coin";
    
    //Symbol of Token
    string public symbol = "MMC";

    //Token Transfer Event
    event Transfer(address indexed _from, address indexed _to, uint _value);

    //Approve Event -> Allow someone to send a certain Amount of Tokens from your Address
    event Approve(address indexed _owner, address indexed _spender, uint _value);
    
    //Sell Event
    event Sell(address indexed _buyer, uint _amount);

    //Addresses and associated Balances
    mapping (address => uint) public balanceOf;

    //Addresses and associated Allowances
    mapping (address => mapping(address => uint)) private allowance;
    
    //Contract Address
    address contractAddress = address(this);

    /*
    Transfer Tokens from Contract
    */
    function transferFromContract(address _receiver, uint _value) private returns (bool success) {
        require(balanceOf[contractAddress] >= _value, "Not enough Coins!");
        balanceOf[contractAddress] -= _value;
        balanceOf[_receiver] += _value;
        emit Transfer(contractAddress, _receiver, _value);
        return true;
    }
    
    /*
    Transfer Tokens to Someone
    */
    function transfer(address _receiver, uint _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Not enough Coins!");
        balanceOf[msg.sender] -= _value;
        balanceOf[_receiver] += _value;
        emit Transfer(msg.sender, _receiver, _value);
        return true;
    }

    /*
    Approve a _Spender to send a specific _Value from your Address
    */
    function approve(address _spender, uint _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approve(msg.sender, _spender, _value);
        return true;
    }

    /*
    Transfer Tokens from one Address to another Address
    */
    function transferFrom(address _from, address _to, uint _value) private returns (bool success) {
        require(_value <= balanceOf[_from], "Not enough Coins!");
        require(_value <= balanceOf[_from] - allowance[_from][contractAddress], "Too much Coins reserved in Orders!");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    /*
    Safe Multiply Function
    */
    function mul(uint _a, uint _b) internal pure returns (uint) {
        if (_a == 0) {
            return 0;
        }
        uint c = _a * _b;
        require(c / _a == _b, "Multiplication Overflow");
        return c;
    }

    /*
    Token Sale Function, User sends Ether and receives MMC, 1 Wei = 0.000000000001 MMC
    */
    function buyTokens() public payable {
        uint _numOfTokens = mul(msg.value, tokenPrice);
        transferFromContract(msg.sender, _numOfTokens);
        tokensSold += _numOfTokens;
        emit Sell(msg.sender, _numOfTokens);
    }
}