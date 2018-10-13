require_relative "./player.rb"
require_relative "./board.rb"

class ComputerPlayer < Player

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
    @past_attack_coord = []
  end

  def get_attack
    coord = false
    while !coord || @past_attack_coord.include?(coord)
      row = rand(0...@board.num_rows)
      col = rand(0...@board.num_cols)
      coord = [row, col]
    end
    @past_attack_coord.push(coord)
    col
  end

  def get_direction
    ["u","d","l","r"].sample
  end

  def get_start_pos
    row = rand(0...@board.num_rows)
    col = rand(0...@board.num_cols)
    [row, col]
  end
end
