class Show
  
  def initialize(the_board)
    refresh_terminal
 
    puts "\n\n               1   2    3"
    puts "               "+"~"*11+"         ********************"
    puts "            A | #{the_board.board_hash["a1"]} | #{the_board.board_hash["a2"]} | #{the_board.board_hash["a3"]} |        *     MORPION      *"
    puts "               "+"~"*11+"         ********************"
    puts "            B | #{the_board.board_hash["b1"]} | #{the_board.board_hash["b2"]} | #{the_board.board_hash["b3"]} |"
    puts "               "+"~"*11+"            Choisi une case"
    puts "            C | #{the_board.board_hash["c1"]} | #{the_board.board_hash["c2"]} | #{the_board.board_hash["c3"]} |           (a1 ou b2 etc.)"
    puts "               "+"~"*11
    puts "\n"
    puts "               "+"_"*40+"\n\n\n"
  end

  def refresh_terminal
    system("clear")
  end
end