class Board
  SHIPS = {
    :Ca = {:name => "Carrier", :size => 5},
    :Ba = {:name => "Battleship", :size => 4},
    :Cr = {:name => "Cruiser", :size => 3},
    :Su = {:name => "Submarine", :size => 3},
    :De = {:name => "Destroyer", :size => 2}
  }

  def initialize(board)
    @board = create_board(board) # used to display to enemy players
  end

  def full_display
    @board.each {|row| p row }
  end

  def [](pos)
    row_num, col_num = pos
    @board[row_num][col_num]
  end

  def []=(pos, mark)
    row_num, col_num = pos
    @board[row_num][col_num] = mark
  end

  def ship_destroyed?
    # find symbol that was attacked
    # see if there are any of the symbols left on the board
    # TODO
  end

  private

  def create_board(board)
    rows, cols = board
    Array.new(rows){ Array.new(cols, " ") }
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new([5,6])
  board[2,2] = :X
  board.board.each {|e| p e }
end
