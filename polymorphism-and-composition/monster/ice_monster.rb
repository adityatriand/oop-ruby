class IceMonster < Monster
  
  def attack(monster)
    if @status[0] == "frozen"
      puts "#{@name} is in frozen state, can't attack"
    else
      monster.take_damage(0.8 * @attack_point)
      take_damage(0.5 * monster.attack_point)
      puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals #{0.8 * @attack_point.to_f} damage, takes #{0.5 * monster.attack_point} damage, inflict frozen status for 1 turns with 0 damage each turn"
      monster.set_status(["frozen", 1, 0])
    end
  end
end