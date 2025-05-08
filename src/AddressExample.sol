// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressExample {
    address public owner;          // 普通地址
    address payable public wallet; // 可转账地址

    constructor(address _wallet) {
        owner = msg.sender;        // 部署合约的人
        wallet = payable(_wallet); // 转为 payable 类型以便发送 ETH
    }

    // 查看当前合约的余额
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // 向合约转账（可接受ETH）
    receive() external payable {}

    // 合约将ETH发送到wallet地址
    function transferToWallet(uint amount) public {
        require(msg.sender == owner, "Only owner can transfer");
        require(address(this).balance >= amount, "Insufficient balance");

        wallet.transfer(amount); // 转账
    }

    // 修改钱包地址
    function updateWallet(address newWallet) public {
        require(msg.sender == owner, "Only owner can update");
        wallet = payable(newWallet);
    }
}
