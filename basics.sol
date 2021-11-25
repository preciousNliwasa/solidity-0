// SPDX-license-Identifier : MIT

pragma solidity ^0.6.0;

contract second{

    address my_eth_address =  0xEfb47f6EcDE8573bcb758Ca2CC7d06228E9A96bA;
    string my_name = 'precious nliwasa';
    uint256 age = 12;
    int256 worth = -20;

    enum State {ready,waiting,active}
    State public state;

    string residence;

    constructor() public {
        residence = 'mumba';
        state = State.waiting;
    }

    function get() public view returns(string memory){
        return residence;
    }

    function set(string memory place) public{

        residence = place;

    }

    function makeactive() public{

        state = State.active;

    }

    function isactive() public view returns(bool){

        return state == State.active;
    }

    struct customer{

        string customer_name;
        int256 amount;

    }

    customer[] public custommers;
    mapping(string => int256) public name2amount;

    uint256 public peoplecount;

    function addcustomer(string memory _name,int256 _amount) public {

        custommers.push(customer({customer_name:_name,amount : _amount}));
        name2amount[_name] = _amount;
        peoplecount += 1;
    }

    struct addmembers{
        
        string member;
        uint256 age;
    
    }

    mapping(uint256 => addmembers) public members;

    uint256 public count = 0;

    function setmembers(string memory _member,uint256 _age) public {

        increament();
        members[count] = addmembers(_member,_age);

    }

    function increament() internal{

        count += 1;

    }




}
