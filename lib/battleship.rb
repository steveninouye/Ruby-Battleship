class BattleshipGame
  attr_reader :board, :player

  def initialize (player, board)
    @player = player
    @board = board
  end

  def attack(point)
    board[point] = :x
  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  def play_turn
    x = @player.get_play
    attack(x)
  end

  def display_status
    @board.grid.each {|row| p row }
  end
end
