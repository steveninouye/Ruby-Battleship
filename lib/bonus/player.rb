require_relative "./board.rb"
require_relative "./modules/validation.rb"
require_relative "./modules/calculator.rb"
require_relative "./modules/optimization.rb"

class Player
  attr_reader :name

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
  end

  def post_attack(coord)
    element = @board[coord]
    @board[row, col] = "X"
    element.class == Symbol ? "#{@name}: !!!HIT!!!" : "#{@name}: miss"
  end

  def count
    @board.reduce(0) { |a,row| a + row.count {|e| e.class == Symbol} }
  end

  def defeated?
    count == 0
  end

  def place_ships
    Board::SHIPS.each do |sym, obj|
      @sym, @name, @size = sym, obj[:name], obj[:size]
      valid_ship_input = false
      until valid_ship_input
        @start_pos = get_start_pos # [start_pos, direction]
        @direction = get_direction
        valid_ship_input = validate_ship_input
        place_ship(valid_ship_input) if valid_ship_input
      end
    end
    garbage_collect
  end

  private

  include Ship_Pos_Validation
  include Coordinate_Calculator
  include Memory_Cleanup

  def place_ship(input)
    @size.times do |n|
      coord = operation_passer(n)
      @board[coord] = @sym
    end
  end
end
