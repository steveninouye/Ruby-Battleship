require "./player.rb"
require "./board.rb"

class BattleshipGame
  attr_reader :board, :player

  def initialize (player, board)
    @player = player
    @board = board
  end

  def play
    @board.place_random_ship
    until game_over?
      display_status
      play_turn
    end
  end

  def attack(point)
    p 'attack'
    p point
    board[point] = :x
  end

  def count
    @board.count
  end

  def display_status
    lgth = @board.grid[0].length
    p (0...lgth).to_a    # prints index for grid
    @board.grid.each_with_index do |row, idx| 
      print idx
      p row 
    end
  end

  def game_over?
    @board.won?
  end

  def play_turn
    x = @player.get_play
    attack(x)
  end
end

game = BattleshipGame.new(HumanPlayer, Board.new)

game.play