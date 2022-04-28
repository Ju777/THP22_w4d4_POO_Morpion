class Application
  attr_accessor :current_game, :player_will

  # Boucle infinie qui s'arrête uniquement si les joueurs décident de ne pas renouveler de partie
  def initialize
    welcome_message
    @player_will = get_player_will 

    if @player_will =="o"
      name_player1 = get_player_name(1)
      name_player2 = get_player_name(2)

      # Création d'une nouvelle partie
      @current_game = Game.new(name_player1, name_player2)
      puts "Une nouvelle partie commence !! [ENTER]"   
      gets

    elsif @player_will == "n"
      good_bye_message
    end
  end

  def welcome_message
    # Message de bienvenue
    puts "\n\n        **********************************************"
    puts "        **                                          **"
    puts "        ***     UN MORPION CA GRATTOUILLE ET      ****"
    puts "        ****    TE SOUHAITE LA BIENVENUE ! :)    *****"
    puts "        *****                                   ******"
    puts "        **********************************************"
    puts "\n[ENTER TO CONTINUE]"
    gets

    puts "        REGLES DU JEU"
    puts "     BLABLA BLABLABLABLABLA"
    puts "\n[ENTER TO CONTINUE]"
    gets
  end

  def good_bye_message
    # Message de clôture
    puts "\n\n        **********************************************"
    puts "        **                                          **"
    puts "        ***     LE MORPION TE REMERCIE DE         ****"
    puts "        ****          L'AVOIR GRATTÉ :) !        *****"
    puts "        *****                                   ******"
    puts "        **********************************************"
    puts "\n[ENTER TO QUIT]"
    gets
  end

  def get_player_will
    print "Nouvelle partie ? 'o' / 'n' > "
    player_answer = gets.chomp

    while player_answer != "o" && player_answer != "n"
      print "ERREUR SASIE\nNouvelle partie ? 'o' / 'n' > "
      player_answer = gets.chomp
    end
    return player_answer
  end

  def get_player_name(player_num)
    # Demande du nom du joueur
    print "Nom du joueur #{player_num} > "
    return gets.chomp
  end

  def start_rounds
    round = 1
    while self.current_game.status == true
      self.current_game.play_round(round)
      round += 1
    end
  end
end