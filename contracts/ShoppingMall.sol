// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShoppingMall {
    address public buyer;
    uint public amount;
    address payable public seller;

    function setSellerDetails(address _buyer, uint _amount, address payable _seller) public {
        buyer = _buyer;
        amount = _amount;
        seller = _seller;
    }

    function confirmPurchase() external payable {
        require(msg.sender == buyer, "Only the buyer can confirm the purchase");
        require(msg.value == amount, "Incorrect amount sent");

        seller.transfer(msg.value);
    }
}
