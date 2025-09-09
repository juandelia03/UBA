// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Transfer{
    
    function fondear_contrato() public payable {} 

    function transferir(address payable destinatario, uint monto) public{
        require(address(this).balance >= monto, "Fondos insuficientes");
        destinatario.transfer(monto);
    }
}