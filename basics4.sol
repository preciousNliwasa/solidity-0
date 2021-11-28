/// SPDX-License-Identifier:MIT

pragma solidity ^0.6.0;

contract the_portfolio{

    mapping(string => address) public account;

    function setting_account(string memory _account_name) public{
        account[_account_name] = msg.sender;
    }

    struct portfolio_infrastructure{
        address owner;
        string asset;
    }

    mapping(uint256 => portfolio_infrastructure) public portfolio;
    uint256 public count;

    constructor() public{
        count = 0;
    }

    event purchase(

        address indexed buyer,
        string asset
    );

    function buying_asset(string memory _account_name,string memory _asset) external{
        increament();
        portfolio[count] = portfolio_infrastructure(account[_account_name],_asset);
        emit purchase(account[_account_name],_asset);
    }

    function increament() internal{
        count ++;
    }

}


contract eth_transfer{

    address payable wallet;
    address public token;
    
    function wallet_2_transfer_2(address payable _wallet,address _token) public{
        wallet = _wallet;
        token = _token;
    }

    function transfering_eth(string memory _account_name,string memory _asset) public payable{
        the_portfolio imported = the_portfolio(token);
        imported.buying_asset(_account_name,_asset);
        wallet.transfer(msg.value);
    }


}
