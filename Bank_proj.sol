// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

import "./safemath.sol";

struct main_trader{
    address payable trader;
    uint balance;
}

contract simple_bank{
    main_trader public owner;

    constructor(){
        owner.trader = payable(msg.sender);
        owner.balance = 1;
    }




    modifier verifier_for_deposite(){
        require(owner.trader == msg.sender,"You are not account owner!");
        _;
    }

    event deposite_result(uint value,string massage);

    function deposite() public payable verifier_for_deposite(){
        owner.balance = safemath.sum(owner.balance,msg.value);

        emit deposite_result(msg.value, "Your deposite done successfully.");
    }




    modifier verifier_for_withdrawal(uint amount){
        require(owner.trader == msg.sender,"You are not account owner!");
        require(owner.balance >= amount,"Your balance is insufficient!");
        _;
    }

    event withdrawal_result(uint value,string massage);

    function withdrawal(uint amount) public payable verifier_for_withdrawal(amount){
        owner.balance = safemath.sub(owner.balance,amount);
        
        address payable temp = payable(msg.sender);
        temp.transfer(amount);

        emit withdrawal_result(amount, "Your withdrawal done successfully.");
    }



    modifier verifier_for_show_balance(){
        require(owner.trader == msg.sender,"You are not account owner!");
        _;
    }

    function show_balance() public view verifier_for_show_balance returns(uint){
        return owner.balance;
    }
}