class Board
  attr_accessor :board_hash

  def initialize
    a1 = BoardCase.new("a1", " ")
    a2 = BoardCase.new("a2", " ")
    a3 = BoardCase.new("a3", " ")
    b1 = BoardCase.new("b1", " ")
    b2 = BoardCase.new("b2", " ")
    b3 = BoardCase.new("b3", " ")
    c1 = BoardCase.new("c1", " ")
    c2 = BoardCase.new("c2", " ")
    c3 = BoardCase.new("c3", " ")
    @board_hash = {a1.position => a1.content, a2.position => a2.content, a3.position => a3.content, b1.position => b1.content, b2.position => b2.content, b3.position => b3.content, c1.position => c1.content, c2.position => c2.content, c3.position => c3.content}
  end

  def board_update(boardcase_to_update, player)
    @board_hash[boardcase_to_update] = "X" if player == 1
    @board_hash[boardcase_to_update] = "O" if player == 2    
  end

  def boardcase_status?(boardcase_to_update)
    if @board_hash[boardcase_to_update] == " "
      return true
    else
      return false
    end
  end

end