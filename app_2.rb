require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts " "
puts "Veuillez enter votre nom de guerrier !"
nom = gets.chomp

hplayer1 = HumanPlayer.new(nom)

ennemies = []

ennemies << player1 = Player.new("Josiane")
ennemies << player2 = Player.new("José")
puts " "
puts "Vos adversaires sont :"
ennemies.each do |ennemy|
    ennemy.show_state
end

while hplayer1.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts " "
    hplayer1.show_state
    puts "----------------------"
    puts "Quelle action veux-tu effectuer?"
    puts " "
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts " "
    puts "attaquer un joueur en vue :"
    if player1.life_points > 0
        puts "0 - Josiane a #{player1.life_points} points de vie"
    else
        puts "Le joueur #{player1.name} a été tué !"    
    end
    if player2.life_points > 0
        puts "1 - José a #{player2.life_points} points de vie"
    else
        puts "Le joueur #{player2.name} a été tué !"    
    end

    puts " "
    action = gets.chomp
    puts " "

    if action == "a"
        hplayer1.search_weapon
    elsif action == "s"
        hplayer1.search_health_pack
    elsif action == "0"
        hplayer1.attacks(player1)
    else
        hplayer1.attacks(player2)
    end

    ennemies.each do |ennemy|
        break if ennemy.life_points <= 0 
        ennemy.attacks(hplayer1)
    end
    

end

puts "La partie est terminée!"
if hplayer1.life_points > 0
    puts " "
    puts "BRAVO, TU AS GAGNE!!"
else
    puts " "
    puts "Loser! Tu as perdu !"
end
