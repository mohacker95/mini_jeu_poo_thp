require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Acceuil 
puts "---------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' ! | "    
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "---------------------------------------------"

puts (" ")

#Initialisation du joueur:
humanPlayer1=HumanPlayer.new("moe") # il affiche 10 a la place de 100 why ? 
humanPlayer1.show_state
puts "---------------------------------------------"

puts (" ")



#Initialisation des ennemis 
player1=Player.new("josiane")
player2=Player.new("josé")
player1.show_state 
player2.show_state
ennemis = []
ennemis << player1 << player2

puts "---------------------------------------------"

puts (" ")
#Le combat
puts "welcome to the battle !"
while  humanPlayer1.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
puts "Quelle action veux-tu effectuer ? "
puts "a - chercher une meilleure arme"
puts "s - chercher à se soigner"
puts " "
puts "attaquer un joueur en vue :"
puts "0 - josiane a #{player1.show_state} points de vie"
puts "1 - josé  a #{player2.show_state} points de vie"
puts (" ")
puts " chose an option "
print ">"
option = gets.chomp
if option == "a" 
    puts humanPlayer1.search_weapon
elsif option == "s" 
    puts humanPlayer1.search_health_pack
elsif option == "0" 
    puts humanPlayer1.attacks(player1)
    if 
        player1.life_points < 0
        player1.life_points = 0
    end 
elsif option == "1" 
    puts humanPlayer1.attacks(player2)
    if
    player2.life_points < 0
    player2.life_points = 0
    end 
end 
end 
puts (" ")

puts "ennemis attacking !!"
i = 0

 ennemis.each do
    if ennemis[i].life_points > 0
    ennemis[i].attacks(humanPlayer1)
    else 
        puts "#{ennemis[i].name} is dead !"
        i+=1

    end
    if humanPlayer1.life_points <= 0
        puts "game over they win ;)"
    else 
        puts "you win !!" 
    end 
end 

 binding.pry