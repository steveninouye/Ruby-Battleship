require_relative "./board.rb"
require_relative "./ship.rb"
require_relative "./validation.rb"

class Player
  attr_reader :name

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
    @grid = board  # [num_rows, num_cols]
  end

  def post_attack(coord)
    row, col = coord
    @board[row, col] = :X
  end

  def count
    @board.reduce(0) { |a,row| a + row.count {|e| e.class == Symbol} }
  end

  def defeated?
    count == 0
  end

  private

  include Ship_Pos_Validation

  def operation_passer(n)
    row, col = @start_pos
    row = row.send(@operator, n) if @row
    col = col.send(@operator, n) if !@row
    [row, col]
  end

  def place_ship(input)
    @size.times do |n|
      @board[operation_passer(n)] = @sym
    end
  end

  def garbage_collect
    system "clear"
    [:@sym, :@name, :@size, :@operator, :@start_pos, :@direction, :@row].each {|e| remove_instance_variable(e)}
  end
end
