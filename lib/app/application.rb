class Application
  attr_accessor :current_game, :play_will

  # Boucle infinie qui s'arrête uniquement si les joueurs décident de ne pas renouveler de partie
  def initialize
      @play_will = gets.chomp
      
      name_player1 = get_player_name(1)
      name_player2 = get_player_name(2)

      # Création d'une nouvelle partie
      @current_game = Game.new(name_player1, name_player2)
      puts "Une nouvelle partie commence !! >>>"
      gets
  end

  def get_player_name(player_num)
    # Demande des noms des joueurs
    print "Nom du joueur #{player_num} > "
    return gets.chomp
  end
end