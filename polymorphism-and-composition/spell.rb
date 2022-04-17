class Spell

  attr_reader :name, :type, :status
  
  def initialize(name, type)
    @name = name
    @type = type
    @status = ''
    if @type == 'fire'
      @status = 'burnt'
    elsif @type == 'ice'
      @status = 'frozen'
    end
  end

  def to_s
    "#{@name}[#{@type}]"
  end

  def use_spell(monster)
    status = monster.get_status
    puts "casts #{@name} spell on enemy's #{monster.name}"
    if status[0] != 'normal' && status[0] == @status
      monster.set_status([status[0],status[1]+1,status[2]])
    end
  end
    
  
end