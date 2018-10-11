require_relative "./player.rb"
require_relative "./board.rb"
require_relative "./validation.rb"


class HumanPlayer < Player

  def get_attack
    valid_input = nil
    until valid_input
      puts "What row would you like to attack?"
      validate_num(gets.chomp)
      puts "What column would you like to attack?"
      valid_input = validate_attack(gets.chomp)
      puts "Invalid Input" if !valid_input
    end
    valid_input
  end

  def place_ships
    Board::SHIPS.each do |sym, obj|
      @sym, @name, @size = sym, obj[:name], obj[:size]
      until valid_ship_input
        @start_pos = get_start_pos # [start_pos, direction]
        valid_ship_input = validate_ship_input(input)
        place_ship(valid_ship_input) if valid_ship_input
      end
    end
    garbage_collect
  end

  private

  include Num_Input_Validation

  def get_start_pos
    row = get_num_input(0, 10, "What row would you like to place your #{@name}")
    col = get_num_input(0, 10, "What column would you like to place your #{@name}")
    [row, col]
  end

  def get_ship_input
    @board.full_display
    puts "Where would you like to place your #{@name}(#{@size})?"
    print "Starting position *space separated >2 3< => "
    start_input = gets.chomp
    print "Direction up(u), down(d), left(l), right(r), (retry) >u< => "
    direction = gets.chomp
    [start_input, direction]
  end

  def validate_attack(coord)

  end
end
