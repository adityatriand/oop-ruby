require_relative 'monster'
require_relative 'player'

phpkachu = Monster.new('Phpkachu', 80, 50)
sqlrtle = Monster.new('Sqlrtle', 100, 20)
cppmander = Monster.new('Cppmander', 40, 80)
bashtoise = Monster.new('Bashtoise', 60, 60)
torterraform = Monster.new('Torterraform', 120, 10)

# phpkachu.attack(cppmander)

# monsters = [phpkachu, sqlrtle, cppmander, bashtoise, torterraform]

# monsters.each do |monster|
#   puts monster
# end

adit = Player.new("Player 1",[phpkachu.clone, cppmander.clone, torterraform.clone])
tri = Player.new("Player 2",[sqlrtle.clone, cppmander.clone, bashtoise.clone])

puts adit.status
puts tri.status

puts '=======================Turn 1======================='
puts ''

adit.attack(1,tri.monsters[1])
puts adit.status
puts tri.status

tri.attack(1,adit.monsters[1])
puts adit.status
puts tri.status