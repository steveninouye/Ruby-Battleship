class Board
  attr_reader :board

  def initialize(board)
    @board = create_board(board)
  end

  def create_board(board)
    rows, cols = board
    Array.new(rows){ Array.new(cols, nil) }
  end

  def place_ship
  end

  def []=(row_num, col_num, mark)
    @board[row_num][col_num] = mark
  end
end

board = Board.new([5,6])
board[2,2] = 1
board.board.each {|e| p e }