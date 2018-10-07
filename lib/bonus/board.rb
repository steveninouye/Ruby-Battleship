class Board

  def initialize(board)
    @board = create_board(board)
  end

  def create_board(board)
    rows, cols = board
    Array.new(rows){ Array.new(cols, "") }
  end

  def [](pos)
    row_num, col_num = pos
    @board[row_num][col_num]
  end

  def []=(pos, mark)
    row_num, col_num = pos
    @board[row_num][col_num] = mark
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new([5,6])
  board[2,2] = :X
  board.board.each {|e| p e }
end
