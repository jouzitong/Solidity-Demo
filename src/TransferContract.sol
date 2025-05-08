// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransferContract {

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // 接收 ETH 的函数
    receive() external payable {}

    // 合约余额
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // 查看其他地址余额
    function findBalance(address  addr) public view returns (uint) {
        return addr.balance;
    }

    // 合约向指定地址转账
    function sendEther(address payable to, uint amount) public {
        require(msg.sender == owner, "Only owner can send");
        require(address(this).balance >= amount, "Insufficient balance");
        to.transfer(amount);
    }
}
