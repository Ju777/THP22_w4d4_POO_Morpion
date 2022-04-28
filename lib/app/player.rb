class Player
  attr_accessor :name

  def initialize(player_name)
    @name = player_name
  end

  def choose_a_boardcase
    print "Choisis une case libre > "
    boardcases_list = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
    chosen_boardcase = ""
    while !boardcases_list.include?(chosen_boardcase)  
      chosen_boardcase = gets.chomp
      print "Case non jouable       > " if !boardcases_list.include?(chosen_boardcase)
    end
    return chosen_boardcase
  end

end