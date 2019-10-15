class Player
	attr_accessor :name, :life_points
	
  def initialize (name)
    @name = name
    @life_points = 10
	end

  def show_state
    print "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage (damage_points)
    @life_points -= damage_points
      if life_points <1 
      puts "Le joueur #{@name} a été tué !"
      #else puts "#{@name} a #{@life_points} points de vie"
      end
  end

  def attacks (player)
    damage_points = compute_damage            #les damage_points sont calculés par l'action de compute_damage
    puts "#{@name} attaque #{player.name}"
    puts "Il lui inglige #{damage_points} points de dommages"
    return player.gets_damage(damage_points) #enregistre les damage_points du joueur attaqué après l'attaque
  end

  def compute_damage #donne le damage
    return rand(1..6)
	end
end

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize (name) #itintialise les paramètres des deux classes
		super(name) #appel du paramètre de la classe Player
		@life_points = 100
		@weapon_level = 1
	end

	def show_state #etat des joueurs
    print "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end 

	def compute_damage
    rand(1..6) * @weapon_level
	end

	def search_weapon #choix de l'arme
		dice_result = rand(1..6)
		puts "Tu as trouvé une arme de niveau #{dice_result}"
		if dice_result > weapon_level
		then puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
		@weapon_level = result_dice
		else puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
		end
	end

	def search_health_pack #récupérer de la vie grâce aux soins
		points = rand(1..6)
		if points == 1
				puts "Tu n'as rien trouvé."
		elsif points >=2 && points <=5 && life_points <= 50
				@life_points += 50
				puts "Bravo, tu as trouvé un pack de +50 points de vie !"
		elsif points >=2 && points <= 5 && life_points > 50
				@life_points = 100
				puts "Bravo, tu as trouvé un pack de +50 points de vie !"
		elsif points == 6 && life_points <= 20
				@life_points += 80
				puts "Waow, tu as trouvé un pack de +80 points de vie."
		elsif points == 6 && life_points > 20
				@life_points = 100
				puts "Waow, tu as trouvé un pack de +80 points de vie."
		end
	end
end