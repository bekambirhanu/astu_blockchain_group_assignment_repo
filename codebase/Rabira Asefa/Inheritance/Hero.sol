// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

enum AttackTypes { Brawl, Spell }

interface Enemy {
    function takeAttack(AttackTypes attackType) external;
}

contract Hero {
    uint public health;

    constructor(uint _initialHealth) {
        health = _initialHealth;
    }

    function attack(Enemy enemy) public virtual {
        enemy.takeAttack(AttackTypes.Brawl);
    }
}
