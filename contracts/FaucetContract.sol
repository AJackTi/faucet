// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Faucet {
    uint public numberOfFunders;
    mapping(uint => address) private funders;

    receive() external payable {}

    function addFunds() external payable {
        uint index = numberOfFunders++;
        funders[index] = msg.sender;
    }

    function getAllFunders() external view returns (address[] memory) {
        address[] memory _funders = new address[](numberOfFunders);

        for (uint i = 0; i < numberOfFunders; i++) {
            _funders[i] = funders[i];
        }

        return _funders;
    }

    function getFunderAtIndex(uint8 index) external view returns (address) {
        return funders[index];
    }
}
