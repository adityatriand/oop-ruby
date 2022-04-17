class Player
  attr_reader :cards, :monsters, :spells

  def initialize(name)
    @name = name
    @cards = []
    @monsters = []
    @spells = []
  end
  
  def add_card(card)
    cards << card.dup
  end

  def set_card
    @cards.each do |card|
      if card.respond_to? (:attack)
        monsters << card
      else
        spells << card
      end
    end
  end

  def get_monster_card
    set_card
    return @monsters
  end

  def get_spell_card
    set_card
    return @spells
  end
    
  def to_s
    result = "#{@name}:\n"
    
    @cards.each_with_index do |card, index|
      result += card.to_s
      if index < @cards.size - 1
        result += ', '
      else
        result += "\n"
      end
    end
    
    result
  end

  def play_turn(own_card, opponent_card, opponent)
    print "#{@name}'s "

    if @cards[own_card-1].respond_to? (:attack)
      @cards[own_card-1].attack(opponent.cards[opponent_card-1])
    else
      @cards[own_card-1].use_spell(opponent.cards[opponent_card-1])
    end
    
  end

  def apply_effects
    @cards.each do | card |
      if card.respond_to? (:attack)
        card.check_status
      end
    end
  end
  
end