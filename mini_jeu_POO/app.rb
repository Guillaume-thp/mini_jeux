require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1= Player.new("Josiane")
player2= Player.new("José")


while player1.life_points > 0 && player2.life_points >0 #verifie si les 2 joueurs ne sont pas morts et surtout si le player1 est vivant
puts "\nVoici l'état de nos joueurs :" #\n sert à passer une ligne
puts player1.show_state
puts player2.show_state


puts "\nPassons à la phase d'attaque :"
player1.attacks(player2)
if player2.life_points <=0 #vérifie si le player 2 est vivant avant de réattaquer
  break
end
player2.attacks(player1) #player2 attaque player1
end

player3= HumanPlayer.new("Gui")

binding.pry 