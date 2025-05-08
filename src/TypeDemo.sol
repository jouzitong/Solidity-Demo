// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TypeDemo {
    // 无符号整数类型
    uint public a;
    // 有符号整数类型
    int public b;

    // 地址类型
    address private c;

    address private b;

    function testGet() public returns (uint)  {
        // 这是声明一个局部变量


        return this.a;
    }

}