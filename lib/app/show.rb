class Show
  
  def initialize(the_board)
    puts "Affichage du plateau de morpion [ENTER]"
    gets
    refresh_terminal


    puts "\n\n               1   2    3"
    puts "               "+"~"*11+" "
    puts "            A | #{the_board.board_hash["a1"]} | #{the_board.board_hash["a2"]} | #{the_board.board_hash["a3"]} |"
    puts "               "+"~"*11+" "
    puts "            B | #{the_board.board_hash["b1"]} | #{the_board.board_hash["b2"]} | #{the_board.board_hash["b3"]} |"
    puts "               "+"~"*11+" "
    puts "            C | #{the_board.board_hash["c1"]} | #{the_board.board_hash["c2"]} | #{the_board.board_hash["c3"]} |"
    puts "               "+"~"*11+" \n\n"
    gets

  end

  def refresh_terminal
    system("clear")
  end
end