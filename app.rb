require 'bundler'
require 'pry'
Bundler.require

require_relative './lib/game'
require_relative './lib/player'

humanplayer1 = HumanPlayer.new("Zidane")
humanplayer2 = HumanPlayer.new("Marco")
binding.pry

def presentaion(player1,player2)

  
  puts "A ma droite #{player1.name}"
  player1.show_state
  puts "\nA ma gauche #{player2.name}"
  player2.show_state
  puts "\nvoici l'état des 2 joueur du jour\n"
end

def fight(player1,player2)
  puts "\ndebut du duel entre les deux joueur\n"
  while player1.life_points > 0 && player2.life_points >0
    player1.attacks(player2)
    player2.show_state
    if player2.life_points <= 0 
      break
    else
    player2.attacks(player1)
    player1.show_state
    end
  end
  
end


def performe
  player1 = Player.new("Zidane")
  player2 = Player.new("Marco")
  presentaion(player1,player2)
  sleep 1
  fight(player1,player2)
end

performe

