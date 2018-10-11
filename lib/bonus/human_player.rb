require_relative "./player.rb"
require_relative "./board.rb"
require_relative "./validation.rb"


class HumanPlayer < Player

  def get_attack
    row = get_num_input(0, @board.num_rows - 1, "What row would you like to attack?")
    col = get_num_input(0, @board.num_cols - 1, "What column would you like to attack?")
    [row, col]
  end

  private

  include Num_Input_Validation
  include Direction_Validation

  def get_start_pos
    row = get_num_input(0, @board.num_rows - 1, "What row would you like to place your #{@name}")
    col = get_num_input(0, @board.num_cols - 1, "What column would you like to place your #{@name}")
    [row, col]
  end
end
