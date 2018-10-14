require_relative "./player.rb"
require_relative "./board.rb"
require_relative "./modules/validation.rb"


class HumanPlayer < Player

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
    @enemy_boards = {}
  end

  def display_enemy_boards # displays enemy boards to player
  end

  def get_attack
    @board.display
    row = get_num_input(0, @board.num_rows - 1, "What row would you like to attack?")
    col = get_num_input(0, @board.num_cols - 1, "What column would you like to attack?")
    [row, col]
  end

  private

  include Num_Input_Validation
  include Direction_Validation

  def get_start_pos
    @board.display
    row = get_num_input(0, @board.num_rows - 1, "What row would you like to place your #{@ship_name}")
    col = get_num_input(0, @board.num_cols - 1, "What column would you like to place your #{@ship_name}")
    [row, col]
  end
end
