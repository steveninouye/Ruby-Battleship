class Player
  attr_reader :name

  def initialize (name, board)
    @name = name
    @board = board
  end

  def count
    @board.reduce(0) { |a,row| a + row.count(:s) }
  end

  def defeated?
    count == 0
  end
    
end