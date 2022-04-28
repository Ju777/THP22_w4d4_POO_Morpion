require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)

require 'app/application'
require 'app/game'
require 'app/player'
require 'app/board'
require 'app/boardcase'
require 'app/show'




application = Application.new
application.start_rounds
application.good_bye_message

# SAUVEGARDE DE CE QUI MARCHE !!!
=begin
puts "Nouvelle partie ? 'o' / 'n' > "
user_choice = ""

while user_choice != "o" && user_choice != "n"
  user_choice = gets.chomp
  print "ERREUR : 'o' / 'n' > " if user_choice != "o" && user_choice != "n"
end

# Lancement de l'application
if user_choice == "o"
  application = Application.new # => Enclenche la construction d'une partie
elsif user_choice == "n"
  # Message de clôture
  puts "        **********************************************"
  puts "        **                                          **"
  puts "        ***     LE MORPION TE REMERCIE DE         ****"
  puts "        ****          L'AVOIR GRATTÉ :) !        *****"
  puts "        *****                                   ******"
  puts "        **********************************************"
  puts "\n[ENTER TO QUIT]"
  gets
end


# Début des rounds : 9 maxis avant un nul ou une victoire
application.current_game.play_rounds
=end
# FIN DE SAUVEGARDE DE CE QUI MARCHE !!!
binding.pry

