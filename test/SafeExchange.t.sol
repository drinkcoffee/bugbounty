// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SafeExchange.sol";

contract SafeExchangeTest is Test {
    Bounty public counter;

    function setUp() public {
        counter = new SafeExchange();
//        counter.setNumber(0);
    }

    // function testIncrement() public {
    //     counter.increment();
    //     assertEq(counter.number(), 1);
    // }

    // function testSetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}