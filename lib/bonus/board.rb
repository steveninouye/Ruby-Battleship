class Board
  def initialize(board)
      @board = Array.new(board[0]){ Array.new(board[1]) }
  end

  def place_ship
  end

  def []=(coord)
  end
end