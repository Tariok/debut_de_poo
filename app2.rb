require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def welcome
  puts"-------------------------------------------------\n|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |\n|Le but du jeu est d'être le dernier survivant !|\n-------------------------------------------------"
end

def humanplayer_name
  puts "donne moi le nom du premier joueur"
  user_name = gets.chomp
  return humanplayer1 = HumanPlayer.new(user_name)
end

def huge_fight (humanplayer1,player1,player2,enemies)
  puts "\ndébut de la partie\n"
  while humanplayer1.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts "Quelle action veux-tu effectuer ?\n\na - chercher une meilleure arme\ns - chercher à se soigner\n\nattaquer un joueur en vue :\n0 - #{player1.name} a #{player1.life_points} points de vie\n1 - #{player2.name} a #{player2.life_points} points de vie"
    action = gets.chomp
    if action == "a"
      humanplayer1.search_weapon
    elsif action == "s"
      humanplayer1.search_health_pack
    elsif action == "0"
      humanplayer1.attacks(player1)
    elsif action == "1"
      humanplayer1.attacks(player2)
    end

    puts "ON T'ATTAQUE"

    enemies.each do |player| #boucle pour que les 2 player (bot) attaque  le joueur
      if player.life_points <= 0
        puts "#{player.name} est mort"
      else
        player.attacks(humanplayer1)
      end
    end
    puts humanplayer1.show_state
    
  end
  if humanplayer1.life_points > 0
    puts "\nBRAVO ! TU AS GAGNE "
  else
    puts "\nLoser ! Tu as perdu !"
  end
end

def player1_name
  return player1 = Player.new("Zidane")  
end
def all_enemies(player1,player2)
  enemies = [player1, player2]
  return enemies
end
def player2_name
  return player2 = Player.new("Marco")
end

def performe
  player1 = player1_name
  player2 = player2_name
  enemies = all_enemies(player1,player2)
  welcome
  humanplayer1 = humanplayer_name
  huge_fight(humanplayer1,player1,player2,enemies)
end



performe
binding.pry

