class Show
  
  def initialize(the_board)
    refresh_terminal
 
    puts "\n\n                   1   2   3"
    puts "                  "+"~".light_red*11+"         ********************".light_red
    puts "               A "+"|".light_red+" #{the_board.board_hash["a1"]} "+"|".light_red+" #{the_board.board_hash["a2"]} "+"|".light_red+" #{the_board.board_hash["a3"]} "+"|".light_red+"        "+"*".light_red+"      MORPION     "+"*".light_red
    puts "                  "+"~".light_red*11+"         ********************".light_red
    puts "               B "+"|".light_red+" #{the_board.board_hash["b1"]} "+"|".light_red+" #{the_board.board_hash["b2"]} "+"|".light_red+" #{the_board.board_hash["b3"]} "+"|".light_red#+" "
    puts "                  "+"~".light_red*11+"            Choisis ta case"
    puts "               C "+"|".light_red+" #{the_board.board_hash["c1"]} "+"|".light_red+" #{the_board.board_hash["c2"]} "+"|".light_red+" #{the_board.board_hash["c3"]} "+"|".light_red+"           (a3 ou c2 etc.)"
    puts "                  "+"~".light_red*11
    puts "\n\n\n\n"
  end

  def refresh_terminal
    system("clear")
  end
end