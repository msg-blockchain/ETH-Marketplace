pragma solidity 0.5.11;

/**TODO
 * createNewUser(): only specific addresses should be able to create a user, also just one per address
 * new function: show list of all Users
 * add item list / "inventory" for Users
 * Error Messages
 */

//Contract for Marketplace
contract Marketplace {

//User----------------------------------------------

    //Initial Coins a User gets when creating an Account
    uint256 initialCoins = 500;

    //Counting Users
    uint256 public userCount = 0;

    //User Instance
    struct User {
        //Person ID
        uint userId;
        //User name
        string name;
        //User address
        address userAddress;
        //Sellable items
    }

    //Mapping with all Users
    mapping(uint => User) public allUsers;

//Auction--------------------------------------------

    //Counting Orders
    uint256 public orderCount = 0;

    //Order Instance
    struct Order {
        //Order Creator, points to a User in allusers, similar to userCount
        uint orderCreator;
        //Order ID
        uint orderId;
        //Auction Name
        string orderName;
        //Order Type (Buy or Sell), if True -> Buy Order, if False -> Sell Order
        bool buy;
        //Order Price
        uint orderPrice;
    }

    //Mapping with all Orders
    mapping(uint => Order) public allOrders;

//Currency--------------------------------------------

    //Show User balance
    function balanceById(uint256 userId) public view returns (uint) {
        address _address = allUsers[userId].userAddress;
        getBalance(_address);
    }

//Marketplace Functions---------------------------------

    //Create new User, every User has to be created from a different Address
    function createNewUser(string memory _name) public{
        address senderAddress = msg.sender;
        bool exists = false;
        //Check if User already exists
        for (uint i = 0; i < userCount; i++) {
            if (allUsers[i].userAddress == senderAddress) {
                exists = true;
            }
        }
        require(exists = false, "User Creation failed because Address is already used.");
        //Create Entry in List of all Users
        allUsers[userCount] = User(userCount, _name, senderAddress);
        //Create Entry in MarketCurrency Smart Contract
        transferFromContract(msg.sender, initialCoins);
        userCount += 1;
    }

    //Show a User
    function showUser(uint index) public view returns (uint, string memory, address, uint256) {
        return (allUsers[index].userId, allUsers[index].name, allUsers[index].userAddress, balanceOf[allUsers[index].userAddress]);
    }

    //Get User by Address
    function getUserByAddress() public view returns (uint) {
        for (uint i = 0; i < userCount; i++) {
            if (allUsers[i].userAddress == msg.sender) {
                uint userNumber = i+1;
                return (userNumber);
            }
        }
    }

    //Create Order
    function createOrder(string memory _Name, bool _Buy, uint _Price) public {
        uint256 orderCreator = getUserByAddress();
        //Create Entry in List of all Orders
        allOrders[orderCount] = Order(orderCreator, orderCount, _Name, _Buy, _Price);
        orderCount += 1;
    }
    
    //Market Currency-----------------------------------------------------------------
    
    //Total Number of Tokens
    uint256 public totalSupply = 1000000;
    //Name of Token
    string public name;
    //Symbol / Ticker of the Token
    string public symbol;

    //Token Transfer Event
    event Transfer(address indexed _from, address indexed _to, uint _value);

    //Approve Event -> Allow someone to send Tokens from your Address
    event Approve(address indexed _owner, address indexed _spender, uint _value);

    //Addresses and associated Balances
    mapping(address => uint256) public balanceOf;

    //Addresses and associated Allowances
    mapping(address => mapping(address => uint256)) public allowance;
    
    //Contract address
    address contractAddress = address(this);

//Functions

    //Create the Market Currency
    function createCurrency(string memory _Name, string memory _Symbol) public {
        name = _Name;
        symbol = _Symbol;
        balanceOf[contractAddress] = totalSupply;
        emit Transfer(address(0), contractAddress, totalSupply);
    }

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
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approve(msg.sender, _spender, _value);
        return true;
    }

    //Transfer Tokens from one Address to another Address
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
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
    uint256 public AssetCounter = 0;
    
    //Token Transfer Event
    event AssetTransfer(address indexed _from, address indexed _to, uint _value);

    //Approve Event -> Allow someone to send Tokens from your Address
    event AssetApprove(address indexed _owner, address indexed _spender, uint _value);

    //Asset IDs and Names
    mapping(uint256 => string) AssetList;

    //Addresses and associated Assets and Balances
    mapping(address => mapping(uint256 => uint256)) public AssetBalanceOf;

    //Addresses and associated Allowances
    mapping(address => mapping(address => uint256)) public assetAllowance;
    
//Functions

    //IN PROGRESS==============================================

    //Create Asset
    function createAsset(string memory _Name, string memory _Symbol) public {
        name = _Name;
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
    function approveAsset(address _spender, uint256 _value) public returns (bool success) {
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
}
