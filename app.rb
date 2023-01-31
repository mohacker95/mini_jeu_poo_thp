# require 'bundler'
# Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#give the players names

player1=Player.new("josiane")
player2=Player.new("josé")
puts "=================================="

# show the state of each player

puts ">> Voici l'etat de chaque joueur :"

puts ">>>a droite , player1 :#{player1.name}"
player1.show_state 

puts ">>>a gauche player2 :#{player2.name}"
player2.show_state
puts" " 

puts "================================="
puts " "

#fight
puts "Passons à la phase d'attaque :"

player1.attacks(player2)
player2.attacks(player1)
puts " "

puts "================================="
puts " "
player1.show_state
player2.show_state

puts " "

puts "================================="
puts " "

while player1.life_points > 0 && player2.life_points > 0 do
    player1.attacks(player2)
    if player2.life_points <= 0
      break
    end
    player2.attacks(player1)
    if player1.life_points <= 0
      break
    end
end 






# binding.pry