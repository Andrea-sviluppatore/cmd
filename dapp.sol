// SPDX-License-Identifier: GPL-3.0
// sviluppo un meccanismo di stacking di token! (SPERO DI FARLO BENE, ALCUNE PAROLE E FRASI NON LE CAPISCO)

pragma solidity 0.8.11;

contract dappStaking{

    using SafeMath for uint256;
    
    constructor(address _owner, uint256 _supply) public{
       _mint(_owner, _supply);
    }

    address[] internal stackHolders;

    //per verifica l'indirizzo di uno stakeHolder

    function isStakeHolders(address _address) public view returns(bool, uint256){
       for (uint256 s = 0; s < stakeholders.length; s += 1){
          if (_address == stakeholders[s]) return (true, s);
       }
       return (false = 0);
    }

    // per aggiungere e rimuovere deli stakeHolder

    function addStakeHolder(address _stackeHolder) public {
       (bool _isStakeholder, ) = isStakeholder(_stakeholder);
       if(!_isStakeholder) stakeholders.push(_stakeholder);
    }

   function removeStakeHolder(address _stackeHolder) public {
      (bool _isStakeholder, uint256 s) = isStakeholder(_stakeholder);
       if(_isStakeholder){
           stakeholders[s] = stakeholders[stakeholders.length - 1];
           stakeholders.pop();
   }

   //Un metodo per recuperare la posta in gioco per uno stakeholder.

   function stakeOf(address _stakeHolder) public view returns(uint256){
     return stake[_stakeHolder];
   }

   //metodo per le puntate aggregate messe tutte insieme

   function totalsStake() public view returns(uint256){
      uint256 _totlasStake = 0;
       for (uint256 s = 0; s < stakeholders.length; s += 1){
           _totalStakes = _totalStakes.add(stakes[stakeholders[s]]);
       }
       return _totalStakes;
   }

   //crea e toglie lo stake

   function createStake(uint256, _stake) public {
       _burn(msg.sender, _stake);
       if(stakes[msg.sender] == 0) addStakeholder(msg.sender);
       stakes[msg.sender] = stakes[msg.sender].add(_stake);
   }

   function removeStake(uint256, _stake) public {
      stakes[msg.sender] = stakes[msg.sender].sub(_stake);
       if(stakes[msg.sender] == 0) removeStakeholder(msg.sender);
       _mint(msg.sender, _stake);
   }

   mapping(address => uint256) internal rewards;

   function rewards(address _stakeHolders) public view returns(uint256){
       return rewards[_stakeHolder];
   }
   
     function totalRewards() public view returns(uint256){
         uint256 _totalRewards = 0;
       for (uint256 s = 0; s < stakeholders.length; s += 1){
           _totalRewards = _totalRewards.add(rewards[stakeholders[s]]);
       }
       return _totalRewards;
     }

     function calculateRewards(address _stakeHolder) public view returns(uint256){
          return stakes[_stakeholder] / 100;
     }

     function distribuireRewards() public onlyOwer{
         for (uint256 s = 0; s < stakeholders.length; s += 1){
           address stakeholder = stakeholders[s];
           uint256 reward = calculateReward(stakeholder);
           rewards[stakeholder] = rewards[stakeholder].add(reward);
       }
     }

     function whitDrowRewards() public {
        uint256 reward = rewards[msg.sender];
       rewards[msg.sender] = 0;
       _mint(msg.sender, reward);
     }

}