/// SPDX-License-Identifier:MIT

pragma solidity ^0.6.0;

contract buyasset{

    struct account_details{

        address account_address;
        string asset;
    }

    mapping(uint256 => account_details) public portifolio;

    address payable wallet;

    function enter_address(address payable _address) public {
        wallet = _address;
    }

    uint256 public count = 0;

    event Purchase(
        address indexed buyer,
        string asset
 );

    function purchasasset(string memory _asset) public payable{
        count +=1;
        // buying the asset
        portifolio[count] = account_details(msg.sender,_asset);
        // sending the ether
        wallet.transfer(msg.value);
        emit Purchase(msg.sender,_asset);
    }


}
