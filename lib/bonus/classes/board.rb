class Board
  SHIPS = {
    :Ca => {:name => "Carrier", :size => 5},
    :Ba => {:name => "Battleship", :size => 4},
    :Cr => {:name => "Cruiser", :size => 3},
    :Su => {:name => "Submarine", :size => 3},
    :De => {:name => "Destroyer", :size => 2}
  }

  def initialize(board)
    @board = create_board(board)
    @ships = SHIPS.keys
  end

  def get_all_coord_val
    result = {}
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |el, col_idx|
        result[row_idx, col_idx] = el
      end
    end
    result
  end

  def num_rows
    @board.length
  end

  def num_cols
    @board[0].length
  end

  def display
    idx_arr = []
    @board[0].each_index {|i| idx_arr.push(i)}
    print "    "; print idx_arr.join("    "); puts ""
    @board.each_with_index {|row, i| puts "#{i} #{row}" }
  end

  def [](coord)
    row_num, col_num = coord
    @board[row_num][col_num]
  end

  def []=(coord, mark)
    row_num, col_num = coord
    @board[row_num][col_num] = mark
  end

  def reduce(acc, &prc)
    @board.reduce(acc) do |ac, row|
      prc.call(ac,row)
    end
  end

  private

  def create_board(board)
    rows, cols = board
    Array.new(rows){ Array.new(cols) { " " } }
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new([5,6])
  board[2,2] = :X
  board.board.each {|e| p e }
end
