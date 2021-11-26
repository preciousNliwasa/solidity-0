/// SPDX-License-Identifier:MIT

pragma solidity ^0.6.0;

contract meag{

    uint256 opening_time;
    address owner;

    constructor() public {
        opening_time = 1637937170;
        owner = msg.sender;
    }

    modifier tim_to_open() {

        require(block.timestamp >= opening_time);
        _;
    }

    modifier onlyowner() {
        require(msg.sender == owner);
        _;
    }

    struct member{

        string full_name;
        uint256 age;
    }

    uint256 public count = 0;

    member[] public addmembers;
    mapping(string => uint256) public special_members;

    function setmembers(string memory _full_name,uint256 _age) public tim_to_open{
        addmembers.push(member({full_name : _full_name,age : _age}));
        special_members[_full_name] = _age;
        count += 1;
    }

    struct classmates{
        string name;
        uint256 age;
        string residence;

    }

    uint256 public cm_count = 0;

    mapping(uint256 => classmates) public class_mates;

    function setclassmates(string memory _name,uint256 _age,string memory _residence) public onlyowner{
        increament();
        class_mates[cm_count] = classmates(_name,_age,_residence);

    }

    function increament() internal {
        cm_count += 1;
    }

    function view_cm_count() public view returns(uint256){
        return cm_count;
    }

    function pure_other(uint256 next_year,uint256 current_year) public pure{
        next_year + current_year;
    }




}
