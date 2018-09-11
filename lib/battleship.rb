class BattleshipGame
  attr_reader :board, :player

  def initialize (player, board)
    @player = player
    @board = board
  end

  def attack(point)
    board[point] = :x
  end
end
