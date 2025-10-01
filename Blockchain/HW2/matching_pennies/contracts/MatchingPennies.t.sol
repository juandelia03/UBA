// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {MatchingPennies} from "./MatchingPennies.sol";
import {Test} from "forge-std/Test.sol";

contract MatchingPenniesTest is Test {
    MatchingPennies game;
    address player1;
    address player2;
    address player3; 

    
    function setUp() public {
        game = new MatchingPennies();
        player1 = vm.addr(1); 
        player2 = vm.addr(2);
        player3 = vm.addr(3);
    }
        

    function test_only_present_players_can_guess() public {
        bytes32 fakeSecret = "super secreto";
        vm.expectRevert(bytes("Solo pueden adivinar los jugadores de este juego"));
        game.guess{value: 0.1 ether}(fakeSecret);
    }
    
}
