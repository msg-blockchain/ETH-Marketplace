pragma solidity 0.5.11;

/**TODO
 * createNewUser(): only specific addresses should be able to create a user, also just one per address
 * new function: show list of all Users
 * add item list / "inventory" for Users
 */

//Contract for Marketplace
contract Marketplace {

    //Set Admin Address
    address admin;

    //Create new Instance of Currency Smart Contract
    MarketCurrency public MainCurrency;

    //Give Start Tokens to a new Account
    //event giveStartTokens(address newAccount, uint _amount);

    //Constructor will be executed when Contract is deployed,
    //put in the Address of the MarketCurrency Smart Contract Address
    constructor (MarketCurrency _marketCurrency) public {
        MainCurrency = _marketCurrency;
        admin = msg.sender;
    }

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
        //Amount of tradecoins
        int tradecoins;
        //User address
        address userAddress;
        //Sellable items
    }

    //Mapping with all Users
    mapping(uint => User) public allUsers;

//Auction--------------------------------------------

    //Counting Auctions
    uint256 public auctionCount = 0;

    //Auction Instance
    struct Auction {
        //Auction Creator, points to a User in allusers, similar to userCount
        uint auctionCreator;
        //Auction ID
        uint auctionId;
        //Auction Name
        string auctionName;
        //Asset Name
        string assset;
        //Start Price
        uint startPrice;
        //Current Price
        uint currentPrice;
        //Auction Duration
        uint auctionDuration;
        //Last Bidder, points to a User in allusers, similar to userCount
        uint lastBidder;
    }

    //Mapping with all Auctions
    mapping(uint => Auction) public allAuctions;

//Currency--------------------------------------------

    //Create the Marketplace Currency
    function createMarketCurrency(string memory _Name, string memory _Symbol) public {
        MainCurrency.createCurrency(_Name, _Symbol);
    }

    //Show User balance
    function balanceOf(uint256 userId) public view returns (uint) {
        address _address = allUsers[userId].userAddress;
        MainCurrency.getBalance(_address);
    }

//Marketplace Functions---------------------------------

    //Create new User, every User has to be created from a different Address
    function createNewUser(string memory _name, int _tradecoins) public{
        address userAddress = msg.sender;
        //Create Entry in List of all Users
        allUsers[userCount] = User(userCount, _name, _tradecoins, userAddress);
        //Create Entry in MarketCurrency Smart Contract
        //MainCurrency.transferFrom()
        //emit giveStartTokens(msg.sender, initialCoins);
        userCount += 1;
    }

    //Show a User
    function showUser(uint index) public view returns (uint, string memory, int, address) {
        return (allUsers[index].userId, allUsers[index].name, allUsers[index].tradecoins, allUsers[index].userAddress);
    }

    //Get User by Address
    function getUserByAddress() public view returns (uint) {
        for (uint i=0; i<userCount;i++) {
            if (allUsers[i].userAddress == msg.sender) {
                uint userNumber = i+1;
                return (userNumber);
            }
        }
    }

    //Create Auction
    function createAuction(string memory _auctionName, string memory _asset,  uint _startPrice, uint _duration) public {
        //Auction Creator has be userAddress
        uint auctionCreator = getUserByAddress();
        //Create Entry in List of all Auctions
        allAuctions[auctionCount] = Auction(
            auctionCreator, auctionCount, _auctionName,
            _asset, _startPrice, _startPrice,
            _duration, auctionCreator);
        AssetCreation assetCreator = new AssetCreation();
        assetCreator.createAsset(_asset);
        auctionCount += 1;
    }
}

//----------------------------------------------------------------------
//Contract for Market Currency
contract MarketCurrency {

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

//Functions

    //Create the Market Currency
    function createCurrency(string memory _tokenName, string memory _tokenSymbol) public {
        name = _tokenName;
        symbol = _tokenSymbol;
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    //Transfer Tokens from Owner Account
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
}

//---------------------------------------------------------------------------------------------------------------------
//Contract for Asset Creation
contract AssetCreation {
    function createAsset(string memory __assetName) public {
        new AssetCoin(__assetName);
    }
}

//Contract for Assets
contract AssetCoin {
    //Variables
    address owner;
    string name;
    uint8 totalAssets;

    //Mapping of Addresses and Assetbalance
    mapping(address => uint8) public balances;

    //Constructor for Creating a new Asset
    constructor(string memory _name) public {
        owner = msg.sender;
        name = _name;
        totalAssets = 1;
        balances[owner] = totalAssets;
    }

    //Transfering an Asset
    event Transfer(address indexed _from, address indexed _to, uint8 _amount);
    function transfer(address _to) public returns (bool) {
        //Check if Sender owns Asset
        //Update Balances
        address _from = msg.sender;
        owner = _to;
        emit Transfer(_from, _to, 1);
        balances[_from] = 0;
        balances[_to] = 1;
        return true;
    }

    //Get Balance of Address
    function getBalance(address _tokenAddress) public view returns (uint) {
        return balances[_tokenAddress];
    }
}