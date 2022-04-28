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

      player_to_play = who_s_turn(round)
      print " Choisis un case > "
      chosen_boardcase = gets.chomp

      # Est-ce une saisie valide ? Si oui, est-ce une case libre ?
      while !bordcase_valid?(chosen_boardcase) || !@board.boardcase_status?(chosen_boardcase)
        Show.new(@board)
        print "Ré-essaie > "
        chosen_boardcase = gets.chomp
        #@board.boardcase_status?(chosen_boardcase) if bordcase_valid?(chosen_boardcase)
      end 
      
      # Mise à jour de la case avec une 'X' ou un 'O'
      @board.board_update(chosen_boardcase, 1) if player_to_play == 1
      @board.board_update(chosen_boardcase, 2) if player_to_play == 2

      # Y'a-t-il un vainqueur ? Si oui => fin de partie
      victory = winner?(chosen_boardcase)

      if victory == true
        @status = false
        puts "@status devient false"
      elsif victory == false && round == 9
        puts "MATCH NUL !"
        @status = false
        puts "@status devient false"
      end
  end

  # Méthode qui indique quel joueur doit jouer
  def who_s_turn(round)
    player1 = @players_array[0]
    player2 = @players_array[1]

    if round.even?
      print " * #{player2.name} *"
      return 2
    else
      print " * #{player1.name} *"
      return 1
    end
  end

  # Méthode qui contrôle la validité de la saisie clavier d'une case choisie
  def bordcase_valid?(chosen_boardcase)
    valids_boardcases = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
    if valids_boardcases.include?(chosen_boardcase)
      puts "saisie valide"
      gets
      return true 
    else
      puts "saisie non valide"
      gets
      return false
    end
  end

  # Méthode qui vérifie s'il y a un gagnant après qu'un joueur ait choisi une case
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

  # Les 8 méthodes qui suivent vérifient si 3 pions sont alignés horizontalement, verticalement et en digaonale
  # 1
  def ligneA?(last_boardcase_updated)
    if (last_boardcase_updated == "a1" || last_boardcase_updated == "a2" || last_boardcase_updated == "a3") && (@board.board_hash["a1"] == @board.board_hash["a2"] && @board.board_hash["a1"] == @board.board_hash["a3"])
      puts "GAGNÉ ! LIGNE A" 
      puts "[ENTER]"
      gets
      return true
    else
      false
    end
  end

  # 2
  def ligneB?(last_boardcase_updated)
    if (last_boardcase_updated == "b1" || last_boardcase_updated == "b2" || last_boardcase_updated == "b3") && (@board.board_hash["b1"] == @board.board_hash["b2"] && @board.board_hash["b1"] == @board.board_hash["b3"])
      puts "GAGNÉ ! LIGNE B" 
      puts "[ENTER]"
      gets
      return true
    else
      false
    end
  end
  
  # 3
  def ligneC?(last_boardcase_updated)
    if (last_boardcase_updated == "c1" || last_boardcase_updated == "c2" || last_boardcase_updated == "c3") && (@board.board_hash["c1"] == @board.board_hash["c2"] && @board.board_hash["c1"] == @board.board_hash["c3"])
        puts "GAGNÉ ! LIGNE C" 
        puts "[ENTER]"
        gets
        return true
    else
      false
    end
  end

  # 4
  def ligne1?(last_boardcase_updated)
    if (last_boardcase_updated == "a1" || last_boardcase_updated == "b1" || last_boardcase_updated == "c1") && (@board.board_hash["a1"] == @board.board_hash["b1"] && @board.board_hash["a1"] == @board.board_hash["c1"])
        puts "GAGNÉ ! LIGNE 1" 
        puts "[ENTER]"
        gets
        return true
    else
      false
    end
  end

  # 5
  def ligne2?(last_boardcase_updated)
    if (last_boardcase_updated == "a2" || last_boardcase_updated == "b2" || last_boardcase_updated == "c2") && (@board.board_hash["a2"] == @board.board_hash["b2"] && @board.board_hash["a2"] == @board.board_hash["c2"])
        puts "GAGNÉ ! LIGNE 2" 
        puts "[ENTER]"
        gets
        return true
    else
      false
    end
  end

  # 6
  def ligne3?(last_boardcase_updated)
    if (last_boardcase_updated == "a3" || last_boardcase_updated == "b3" || last_boardcase_updated == "c3") && (@board.board_hash["a3"] == @board.board_hash["b3"] && @board.board_hash["a3"] == @board.board_hash["c3"])
        puts "GAGNÉ ! LIGNE 3" 
        puts "[ENTER]"
        gets
        return true
    else
      false
    end
  end

  # 7
  def ligneA1?(last_boardcase_updated)
    if (last_boardcase_updated == "a1" || last_boardcase_updated == "b2" || last_boardcase_updated == "c3") && (@board.board_hash["a1"] == @board.board_hash["b2"] && @board.board_hash["a1"] == @board.board_hash["c3"])
        puts "GAGNÉ ! LIGNE A1" 
        puts "[ENTER]"
        gets
        return true
    else
      false
    end
  end

  # 8
  def ligneC1?(last_boardcase_updated)
    if (last_boardcase_updated == "c1" || last_boardcase_updated == "b2" || last_boardcase_updated == "a3") && (@board.board_hash["c1"] == @board.board_hash["b2"] && @board.board_hash["c1"] == @board.board_hash["a3"])
        puts "GAGNÉ ! LIGNE C1" 
        puts "[ENTER]"
        gets
        return true
    else
      false
    end
  end
end
