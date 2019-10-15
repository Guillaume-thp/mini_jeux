require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#def accueil #accueil du joueur
    puts "------------------------------------------------"
    puts "Bienvenue sur 'ILS VEULENT TOUS MA POO !      |"
    puts "Le but du jeu est d'être le dernier survivant !|"
    puts "-------------------------------------------------"
#end

#def debut #le joueur doit renseigner son prénom et un joueur à son nom secret
    puts "Quel est ton prénom"
    print "> "
    user_name = gets.chomp
    user = HumanPlayer.new("#{user_name}")
#end

#def enemies_init #initialion d un array d ennemis
	enemies = []
	enemies << player1= Player.new("Josiane") #Josiane et José partent dans l array enermies.
	enemies << player2= Player.new("José")
#end

#def combat
	while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
		puts "\nVoici ton état :" #annonce de l'état du joueur
		puts user.show_state
		puts "Quelle action veux-tu effectuer ?"
		puts "\na - chercher une meilleure arme"
		puts "s - chercher à se soigner"
		puts "\nattaquer un joueur en vue :" #action à choisir
		puts "0 - #{player1.show_state}"
		puts "1 - #{player2.show_state}"
		print "> "
		choice = gets.chomp
		if choice == "a"
			user.search_weapon
		elsif choice == "s"
			user.search_health_pack
		elsif choice == "0"
			user.attacks.(player1)
		elsif choice == "1"
			user.attacks.(player2)
		else
			puts "Choix inconnu, veuillez réessayer"
		end
	end
#end


binding.pry

