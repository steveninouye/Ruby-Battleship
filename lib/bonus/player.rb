require_relative "./board.rb"

class Player
  attr_reader :name

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
  end

  def post_attack(coord)
    row, col = coord
    @board[row, col] = :X
  end

  def count
    @board.reduce(0) { |a,row| a + row.count(:O) }
  end

  def defeated?
    count == 0
  end
end