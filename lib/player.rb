require 'pry'

class Player
    attr_accessor :name , :life_points
    
    #initialize the player 
    def initialize (name)
        @name = name #string 
        @life_points = 10
    end 

    #show the state of the player
    def show_state
       puts "#{@name} a #{@life_points} point de vie" 
    end 

    #number of damage
    def gets_damage(nb_of_damage)
        @life_points = @life_points - nb_of_damage

        if @life_points <= 0 
            puts "le joyeur #{@name} a été tué !"
        end 

    end 
    #attacks 
    def attacks(player)
        puts "le joueur #{@name} attaque le joueur #{player.name}"
        dé = compute_damage
        gets_damage(dé)
        puts "il lui inflige #{dé} points de dommages"
    end 
    
    
    #dé 
    def compute_damage
        return rand(1..6)
    end 

end 

#version 2 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

class HumanPlayer < Player 
    attr_accessor :weapon_level

    def initialize (name )
        super (name)
        @life_points = 100
        @weapon_level = 1
        
    end 

    def show_state
        puts "#{@name} a #{@life_points} point de vie et une arme de niveau #{@weapon_level} " 
    end 

    def compute_damage
        rand(1..6) * @weapon_level
    end 

    def search_weapon
        weapon_found = rand(1..6) 
        puts "Tu as trouvé une arme de niveau #{weapon_found}"
        if weapon_found > @weapon_level 
            @weapon_level = weapon_found
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
           
        end 
    end 

    def search_health_pack

        health_pack_found = rand(1..6)

        if health_pack_found  == 1 
            puts "Tu n'as rien trouvé... "

        elsif health_pack_found  == 6
            @life_points = @life_points + 80
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
        
        else 
            @life_points = @life_points + 50
             puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        end 
        if @life_points > 100
            @life_points = 100 
            puts "over 100 greedy !!"
        end 


    end 

    end 
















# binding.pry
# puts "end of file"