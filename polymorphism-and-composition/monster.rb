class Monster
  attr_reader :name, :attack_point
  
  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
    @status = ["normal", 0, 0]
  end

  def get_status
    return @status
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

  private :take_damage
  
end