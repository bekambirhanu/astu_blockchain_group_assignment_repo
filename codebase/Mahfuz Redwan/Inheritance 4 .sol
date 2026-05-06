
import "./Hero.sol";

contract Mage is Hero(50) {
    function attack(Enemy _enemy) override public {
        _enemy.takeAttack(AttackTypes.Spell);
        
        super.attack(_enemy);
    }
}

contract Warrior is Hero(200) {
    function attack(Enemy _enemy) override public {
        _enemy.takeAttack(AttackTypes.Brawl);
      
        super.attack(_enemy);
    }
}
