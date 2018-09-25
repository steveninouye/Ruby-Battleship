require_relative "./player.rb"
require_relative "./board.rb"

class HumanPlayer << Player
  attr_reader :name

  def initialize (name, board = Board.new)
    @name = name
    @board = board
  end
  
end