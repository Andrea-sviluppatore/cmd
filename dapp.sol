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

    function prelevare() public {
        mappature[msg.sender].pop(strutture("bnb", msg.value, address(0)));
    }

    string owner ="deployer";

   constructor(owner _deployer) public {
      owner = _deployer;
   }


}

//funczione per prelevare cio che ho depositato(attento alla sicurezza)
//constructor e metodo che rende owner il deployer(modifier)