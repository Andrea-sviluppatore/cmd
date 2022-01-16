//SPDX-License-Identifier: Unlicensed

pragma solidity 0.8.11;

contract contratto{

    struct strutture {
       string name;
       uint256 quantita;
       address deposito;
    }

    mapping(address => strutture[] ) public mappature ;


    function deposit() public payable {
       mappature[msg.sender].push(strutture("bnb", msg.value, address(0)));

    }


}

//funczione per prelevare cio che ho depositato(attento alla sicurezza)
//constructor e metodo che rende owner il deplyer(modifier)