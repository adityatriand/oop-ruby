class Monster
  attr_reader :name, :attack_point
  attr_accessor :status
  
  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
    # for element 1 : effect element of monster
    # for element 2 : effect duration
    # for element 3 : attack point
    @status = ["normal", 0, 0]
    
  end

  def set_status(status)
    @status = status
  end
  
  def check_status
    if @status[0] == "burnt"
      take_damage(@status[2])
    end
    
    @status[1] -= 1
    if @status[1] == 0 
      @status[0] = "normal"
    end
  end
    
  def to_s
    if @hitpoint > 0
      if @status[0] != "normal"
        "#{@name}[#{@hitpoint}][#{@status[0]}]"
      else
        "#{@name}[#{@hitpoint}]"
      end
    else
      "#{@name}[X]"
    end
  end

  def attack(monster)
    if @status[0] == "frozen"
      puts "#{@name} is in frozen state, can't attack"
    else
      puts "#{@name} attacks enemy's #{monster.name}, deals #{@attack_point.to_f} damage and takes #{0.5 * monster.attack_point} damage"
      monster.take_damage(@attack_point)
    end
  end

  def take_damage(amount)
    @hitpoint -= amount
  end
end

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
