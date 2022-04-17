class Player

  attr_accessor :monsters, :name
  
  def initialize(name,monsters)
    @monsters = monsters
    @name = name
  end

  def status
    puts "#{@name}:"
    index = 1
    show = ''
    @monsters.each do |monster|
      if(monster.hitpoint > 0)
        if(index != @monsters.length())
          show += "#{monster.name}[#{monster.hitpoint}], "
        else
          show += "#{monster.name}[#{monster.hitpoint}]"
        end
      else
        if(index != @monsters.length())
          show += "#{monster.name}[X], "
        else
          show += "#{monster.name}[X]"
        end
      end
      index += 1
    end
    puts show
  end

  def attack(number_monster, enemy_monster)
    number_monster -= 1
    player_monster = monsters[number_monster]
    
    enemy_monster.take_damage(player_monster.attack_point)
    player_monster.take_damage(0.5 * enemy_monster.attack_point)
    
    puts "#{@name}'s #{player_monster.name} attacks enemy's #{enemy_monster.name}, deals #{player_monster.attack_point.to_f} damage and takes #{0.5 * enemy_monster.attack_point} damage"
    puts ''
  end
  
end