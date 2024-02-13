// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

library safemath{

    modifier forsub(uint num1,uint num2){
        require(num1 >= 0,"number is unacceptable!");
        require(num2 >= 0,"number is unacceptable!");
        require(num1 >= num2,"number is unacceptable!");
        _;
    }

    function sub(uint a , uint b) public pure forsub(a, b) returns (uint){
        return a - b;
    }

    modifier forsum(uint num1,uint num2){
        require(num1 >= 0,"number is unacceptable!");
        require(num2 >= 0,"number is unacceptable!");
        require(num1 + num2 > num1,"number is unacceptable!");
        require(num1 + num2 > num2,"number is unacceptable!");
        _;
    }

    function sum(uint a , uint b) public pure forsum(a, b) returns (uint){
        return a + b;
    }
}