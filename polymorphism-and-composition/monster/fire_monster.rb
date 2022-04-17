class FireMonster < Monster
  
  def attack(monster)
    if @status[0] == "frozen"
      puts "#{@name} is in frozen state, can't attack"
    else
      puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals 0 damage, takes #{0.5 * monster.attack_point} damage, inflict burnt status for 3 turns with #{0.4 * @attack_point.to_f} damage each turn"
      take_damage(0.5 * monster.attack_point)
      monster.set_status(["burnt", 3, 0.4 * @attack_point.to_f])
    end
  end
end