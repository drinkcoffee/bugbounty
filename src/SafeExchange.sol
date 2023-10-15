// SPDX-License-Identifier: BSD
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract SafeExchange {
    address public owner;
    address public newAdmin;

    event Exchanged(address seller);

    error NotCorrectAmount();
    error NotAnEOA(address account);

    constructor(address _newAdmin) payable {
        owner = msg.sender;
        newAdmin = _newAdmin;
    }

    // Seller calls this, to exchange control of admin rights for the PRICE
    // NOTE: transaction must be sent by the account with DEFAULT ADMIN on the business logic contract
    function exchange() external {
        // Prevent contract accounts calling this.
        if (msg.sender != tx.origin) {
            revert NotAnEOA(msg.sender);
        }

        // TODO call to business logic contract to 
        // TODO 1. call getRoleMemberCount and check the number of DEFAULT_ADMIN_ROLE is now 1 
        // TODO 2. grantRole DEFAULT_ADMIN_ROLE for newAdmin
        // TODO 3. renounceRole DEFAULT_ADMIN_ROLE for msg.sender
        // Send the BOUNTY to msg.sender

        emit Exchanged(msg.sender);
    }


    function refund() external {
        // TODO check is owner
        // TODO check if after BOUNTY PERIOD
        // Transfer $ to owner
        // TOOD add static analysis override
        selfdestruct(payable(owner));

    }

    /**
     * Price is the amount being offered for the admin account
     */
    function price() external view returns (uint256) {
        return address(this).balance;
    }
}