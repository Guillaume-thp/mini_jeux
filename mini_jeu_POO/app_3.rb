#require 'bundler'
#Bundler.require
#require_relative 'lib/game'
require_relative 'lib/player'
def accueil
 puts "-------------------------------------------------"
 puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO !'     |"
 puts "|Le but du jeu est d'être le dernier survivant !|"
 puts "-------------------------------------------------"
end
def create_player
 puts "Quel est ton prénom?"
 player_name = gets.chomp
 @human_player = HumanPlayer.new("#{player_name}")
end
def create_ennemies
 ennemies_array = [@player1 = Player.new("Josiane"), @player2 = Player.new("José")]
 return ennemies_array
end
def battle
 while @human_player.life_points > 0 && (@player1.life_points > 0 || @player2.life_points > 0)
     @human_player.show_state
     puts "\nQuelle action veux-tu effectuer ?"
     puts "a - chercher une meilleure arme"
     puts "s - chercher à se soigner"
     puts "\nattaquer un joueur en vue :"
     puts "0 - #{@player1.show_state}"
     puts "1 - #{@player2.show_state}"
     entry = gets.chomp
         if entry == "a"
             @human_player.search_weapon
         elsif entry == "s"
             @human_player.search_health_pack
         elsif entry == "0"
             @human_player.attacks(@player1)
         elsif entry == "1"
             @human_player.attacks(@player2)
         end
     puts "Les autres joueurs t'attaquent !"
     create_ennemies.each do |ennemy|
         if @human_player.life_points <= 0 || ennemy.life_points <= 0
             break
         elsif
             ennemy.attacks(@human_player)
         end
     end
 end
 puts "La partie est finie."
 if @human_player.life_points >=0
     puts "BRAVO ! TU AS GAGNE !"
 else
     puts "Loser ! Tu as perdu !"
 end
end
def perform
 accueil
 create_player
 create_ennemies
 battle
end
perform