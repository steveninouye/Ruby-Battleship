require_relative "./player.rb"
require_relative "./board.rb"

class ComputerPlayer < Player

  def get_attack
    row = rand(0...@board.num_rows)
    col = rand(0...@board.num_cols)
    [row, col]
  end

  def get_start_pos
    row = rand(0...@board.num_rows)
    col = rand(0...@board.num_cols)
    [row, col]
  end

  def get_direction
    ["u","d","l","r"].sample
  end
end
