// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Faucet {
    uint public numberOfFunders;
    mapping(address => bool) private funders;
    mapping(uint => address) private lutFunders;

    receive() external payable {}

    function addFunds() external payable {
        address funder = msg.sender;

        if (!funders[funder]) {
            uint index = numberOfFunders++;
            funders[funder] = true;
            lutFunders[index] = funder;
        }
    }

    function withdraw(uint withdrawAmount) external {
        require(withdrawAmount <= 100000000000000000, "Cannot withdraw more than 0.1 ether");
        payable(msg.sender).transfer(withdrawAmount);
    }

    function getAllFunders() external view returns (address[] memory) {
        address[] memory _funders = new address[](numberOfFunders);

        for (uint i = 0; i < numberOfFunders; i++) {
            _funders[i] = lutFunders[i];
        }

        return _funders;
    }

    function getFunderAtIndex(uint8 index) external view returns (address) {
        return lutFunders[index];
    }
}
