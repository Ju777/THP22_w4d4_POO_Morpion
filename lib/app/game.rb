class Game
  attr_accessor :players_array, :board, :status

  def initialize(name_player1, name_player2)
    @players_array = []
    @players_array << Player.new(name_player1)
    @players_array << Player.new(name_player2)
    @board = Board.new
    @status = true
  end

  def play_round(round)
    @status = true
    player1 = @players_array[0]
    player2 = @players_array[1]

    # Affichage du plateau de jeu vide
    Show.new(@board)

      # Annonce du round
      puts "Round #{round} !"

      player_to_play = who_s_turn(round) 
      # Annonce du joueur qui doit jouer
      if player_to_play == 1
        # Le joueur 1 choisi un case
        boardcase_to_update = player1.choose_a_boardcase
        # La case choisie se met à jour avec une "X"
        @board.board_update(boardcase_to_update, 1)
      end

      if player_to_play == 2
        # Le joueur 2 choisi un case
        boardcase_to_update = player2.choose_a_boardcase
        # La case choisie se met à jour avec un "O"
        @board.board_update(boardcase_to_update, 2)
      end

      # Affichage du plateau de jeu mis à jour
      Show.new(@board)
      
      # Y'a-t-il un vainqueur ? Si oui => message de fin de partie
      victory = winner?(boardcase_to_update)

      if victory == true
        @status = false
        puts "@status devient false"
      elsif victory == false && round == 9
        puts "MATCH NUL !"
        @status = false
        puts "@status devient false"
      end
      binding.pry
  end # Fin de la méthode

  def who_s_turn(round)
    player1 = @players_array[0]
    player2 = @players_array[1]

    if round.even?
      puts "C'est à #{player2.name} !"
      return 2
    else
      puts "C'est à #{player1.name} !"
      return 1
    end
  end

  def winner?(last_boardcase_updated)
    return true if ligneA?(last_boardcase_updated)  
    return true if ligneB?(last_boardcase_updated)
    return true if ligneC?(last_boardcase_updated)
    return true if ligne1?(last_boardcase_updated)
    return true if ligne2?(last_boardcase_updated)
    return true if ligne3?(last_boardcase_updated)
    return true if ligneA1?(last_boardcase_updated)
    return true if ligneC1?(last_boardcase_updated)
    return false
  end

  def ligneA?(last_boardcase_updated)
    if (last_boardcase_updated == "a1" || last_boardcase_updated == "a2" || last_boardcase_updated == "a3") && (@board.board_hash["a1"] == @board.board_hash["a2"] && @board.board_hash["a1"] == @board.board_hash["a3"])
      puts "GAGNÉ ! LIGNE A" # CHANGER LE STATUS DE LA PARTIE à TERMINÉE
      puts "[ENTER]"
      gets
      return true
    else
      false
    end
  end

  def ligneB?(last_boardcase_updated)
    if (last_boardcase_updated == "b1" || last_boardcase_updated == "b2" || last_boardcase_updated == "b3") && (@board.board_hash["b1"] == @board.board_hash["b2"] && @board.board_hash["b1"] == @board.board_hash["b3"])
      puts "GAGNÉ ! LIGNE B" # CHANGER LE STATUS DE LA PARTIE à TERMINÉE
      puts "[ENTER]"
      gets
      return true
    else
      false
    end
  end
  
  def ligneC?(last_boardcase_updated)
    if (last_boardcase_updated == "c1" || last_boardcase_updated == "c2" || last_boardcase_updated == "c3") && (@board.board_hash["c1"] == @board.board_hash["c2"] && @board.board_hash["c1"] == @board.board_hash["c3"])
        puts "GAGNÉ ! LIGNE C" # CHANGER LE STATUS DE LA PARTIE à TERMINÉE
        puts "[ENTER]"
        gets
        return true
    else
      false
    end
  end

  def ligne1?(last_boardcase_updated)
    if (last_boardcase_updated == "a1" || last_boardcase_updated == "b1" || last_boardcase_updated == "c1") && (@board.board_hash["a1"] == @board.board_hash["b1"] && @board.board_hash["a1"] == @board.board_hash["c1"])
        puts "GAGNÉ ! LIGNE 1" # CHANGER LE STATUS DE LA PARTIE à TERMINÉE
        puts "[ENTER]"
        gets
        return true
    else
      false
    end
  end

  def ligne2?(last_boardcase_updated)
    if (last_boardcase_updated == "a2" || last_boardcase_updated == "b2" || last_boardcase_updated == "c2") && (@board.board_hash["a2"] == @board.board_hash["b2"] && @board.board_hash["a2"] == @board.board_hash["c2"])
        puts "GAGNÉ ! LIGNE 2" # CHANGER LE STATUS DE LA PARTIE à TERMINÉE
        puts "[ENTER]"
        gets
        return true
    else
      false
    end
  end

  def ligne3?(last_boardcase_updated)
    if (last_boardcase_updated == "a3" || last_boardcase_updated == "b3" || last_boardcase_updated == "c3") && (@board.board_hash["a3"] == @board.board_hash["b3"] && @board.board_hash["a3"] == @board.board_hash["c3"])
        puts "GAGNÉ ! LIGNE 3" # CHANGER LE STATUS DE LA PARTIE à TERMINÉE
        puts "[ENTER]"
        gets
        return true
    else
      false
    end
  end

  def ligneA1?(last_boardcase_updated)
    if (last_boardcase_updated == "a1" || last_boardcase_updated == "b2" || last_boardcase_updated == "c3") && (@board.board_hash["a1"] == @board.board_hash["b2"] && @board.board_hash["a1"] == @board.board_hash["c3"])
        puts "GAGNÉ ! LIGNE A1" # CHANGER LE STATUS DE LA PARTIE à TERMINÉE
        puts "[ENTER]"
        gets
        return true
    else
      false
    end
  end

  def ligneC1?(last_boardcase_updated)
    if (last_boardcase_updated == "c1" || last_boardcase_updated == "b2" || last_boardcase_updated == "a3") && (@board.board_hash["c1"] == @board.board_hash["b2"] && @board.board_hash["c1"] == @board.board_hash["a3"])
        puts "GAGNÉ ! LIGNE C1" # CHANGER LE STATUS DE LA PARTIE à TERMINÉE
        puts "[ENTER]"
        gets
        return true
    else
      false
    end
  end

#  def draw?(winner, round)
#    return true if winner == false && round == 9
#    return false
#  end

  def end_game
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

end