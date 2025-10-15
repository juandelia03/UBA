// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {Token} from "./Token.sol";

contract TokenTest is Test {
    Token public token;
    address public owner = makeAddr("owner");
    address public user1 = makeAddr("user1");
    address public user2 = makeAddr("user2");

    string public constant TOKEN_NAME = "Mi Super Token";
    string public constant TOKEN_SYMBOL = "MST";

    function setUp() public {
        //owner crea contrato
        vm.prank(owner);
        token = new Token(TOKEN_NAME, TOKEN_SYMBOL);

        // ETH a los usuarios para que puedan pagar el gas
        vm.deal(user1, 1 ether);
        vm.deal(user2, 1 ether);
    }

    function test_InitialState() public view {
        assertEq(token.owner(), owner, "El owner no es correcto");
        assertEq(token.getName(), TOKEN_NAME, "El nombre no es correcto");
        assertEq(token.getSymbol(), TOKEN_SYMBOL, "El simbolo no es correcto");
        assertEq(token.totalSupply(), 0, "El suministro inicial deberia ser 0");
    }

    function test_Mint_Success() public {
        uint256 mintAmount = 100;

        vm.prank(owner);
        token.mint(user1, mintAmount);

        assertEq(
            token.totalSupply(),
            mintAmount,
            "El suministro total no aumento correctamente"
        );
        assertEq(
            token.balanceOf(user1),
            mintAmount,
            "El balance de user1 no aumento correctamente"
        );
    }

    function test_Fail_Mint_WhenNotOwner() public {
        vm.prank(user1);
        vm.expectRevert("solo el owner puede mintear tokens");
        token.mint(user1, 100);
    }

    function test_Transfer_Success() public {
        uint256 initialAmount = 100;
        uint256 transferAmount = 30;

        vm.prank(owner);
        token.mint(user1, initialAmount);

        vm.prank(user1);
        token.transfer(user2, transferAmount);

        assertEq(
            token.balanceOf(user1),
            initialAmount - transferAmount,
            "El balance del emisor no disminuyo"
        );
        assertEq(
            token.balanceOf(user2),
            transferAmount,
            "El balance del receptor no aumento"
        );
    }

    function test_Fail_Transfer_InsufficientBalance() public {
        uint256 initialAmount = 100;
        uint256 transferAmount = 101; // Intenta transferir más de lo que tiene

        vm.prank(owner);
        token.mint(user1, initialAmount);

        vm.prank(user1);
        vm.expectRevert("Balance insuficiente");
        token.transfer(user2, transferAmount);
    }

    function test_Sell_Success() public {
        uint256 mintAmount = 100;
        uint256 sellAmount = 40;

        vm.prank(owner);
        token.mint(user1, mintAmount);

        uint256 requiredEth = sellAmount * token.getPrice();
        //  le doy al contrato el eth necesario para vender esos tokens
        vm.deal(address(token), requiredEth);

        uint256 user1EthBalanceBefore = user1.balance;

        vm.prank(user1);
        token.sell(sellAmount);

        assertEq(
            token.balanceOf(user1),
            mintAmount - sellAmount,
            "El balance de tokens del usuario no disminuyo"
        );
        assertEq(
            token.totalSupply(),
            mintAmount - sellAmount,
            "El suministro total no disminuyo"
        );

        // Verificamos los balances de ETH
        assertEq(
            user1.balance,
            user1EthBalanceBefore + requiredEth,
            "El balance de ETH del usuario no aumento correctamente"
        );
        assertEq(
            address(token).balance,
            0,
            "El balance de ETH del contrato deberia ser 0"
        );
    }

    function test_Fail_Sell_InsufficientContractLiquidity() public {
        uint256 mintAmount = 100;
        uint256 sellAmount = 40;

        vm.prank(owner);
        token.mint(user1, mintAmount);

        vm.prank(user1);
        vm.expectRevert("el contrato tiene fondos insuficientes");
        token.sell(sellAmount);
    }

    function test_CanReceiveEth() public {
        uint256 initialBalance = address(token).balance;
        uint256 amountToSend = 1 ether;

        (bool success, ) = address(token).call{value: amountToSend}("");
        assertTrue(success, "El envio de ETH deberia ser exitoso");

        assertEq(
            address(token).balance,
            initialBalance + amountToSend,
            "El balance del contrato no aumento"
        );
    }

    function test_Close_Success_ByOwner() public {
        uint256 contractEth = 2 ether;
        vm.deal(address(token), contractEth);

        uint256 ownerEthBefore = owner.balance;

        vm.prank(owner);
        token.close();

        assertEq(
            owner.balance,
            ownerEthBefore + contractEth,
            "El owner no recibio el balance del contrato"
        );
    }

    function test_Fail_Close_WhenNotOwner() public {
        vm.prank(user1);
        vm.expectRevert("solo el owner puede destruir el contrato");
        token.close();
    }
}
