class Player

  def initialize (name, board)
    @name = name
    @board = board
  end

  def count
    @board.reduce(0) { |arr| arr.count(:s) }
  end

  def defeated?
      count == 0
  end
    
end