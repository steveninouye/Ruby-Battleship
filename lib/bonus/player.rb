require_relative "./board.rb"

class Player
  attr_reader :name

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
  end

  def post_attack(coord)
  end

  def attack(coord)
  end

  def count
    @board.reduce(0) { |a,row| a + row.count(:s) }
  end

  def defeated?
    count == 0
  end
end