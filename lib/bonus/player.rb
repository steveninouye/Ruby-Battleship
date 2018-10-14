require_relative "./board.rb"
require_relative "./modules/validation.rb"
require_relative "./modules/calculator.rb"
require_relative "./modules/optimization.rb"

class Player
  attr_reader :name

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
    @enemy_boards = {}
  end

  def count
    @board.reduce(0) { |a,row| a + row.count {|e| e.class == Symbol} }
  end

  def create_enemy_boards(all_players, board)
    all_players.each do |player|
      @enemy_boards[player.name] = Board.new(board) unless player == self
    end
  end

  def defeated?
    count == 0
  end

  def log_attack(attack_log)

  end

  def place_ships
    Board::SHIPS.each do |sym, obj|
      @sym, @ship_name, @size = sym, obj[:name], obj[:size]
      valid_ship_input = false
      until valid_ship_input
        @start_pos = get_start_pos
        @direction = get_direction
        valid_ship_input = validate_ship_input
        place_ship(valid_ship_input) if valid_ship_input
      end
    end
    garbage_collect
  end

  def post_attack(coord)
    element = @board[coord]
    @board[coord] = "X"
    element.class == Symbol ? :hit : :miss
  end

  private

  include Ship_Pos_Validation
  include Coordinate_Calculator
  include Memory_Cleanup

  def log_attack(attack_log)
    attack_log.each do |name, res|
      mark = res[:result] == :hit ? "X" : "O"
      @enemy_boards[name][res[:coord]] = mark
    end
  end

  def place_ship(input)
    @size.times do |n|
      coord = calculate_coord(n)
      @board[coord] = @sym
    end
  end
end
