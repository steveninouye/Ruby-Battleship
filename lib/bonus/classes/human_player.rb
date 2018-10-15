require_relative "./player.rb"
require_relative "./board.rb"
require_relative "../modules/validation.rb"


class HumanPlayer < Player

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
    @enemy_boards = {}
  end

  def create_enemy_boards(all_players, board)
    all_players.each do |player|
      @enemy_boards[player.name] = Board.new(board) unless player == self
    end
  end

  def display_enemy_boards
    enemy_boards.each do |name, board|
      board.display
    end
  end

  def get_attack
    @board.display
    row = get_num_input(0, @board.num_rows - 1, "What row would you like to attack?")
    col = get_num_input(0, @board.num_cols - 1, "What column would you like to attack?")
    [row, col]
  end

  def log_attack(attack_log, coord)
    attack_log.each do |name, res|
      mark = res == :hit ? "X" : "O"
      @enemy_boards[name][coord] = mark
    end
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
