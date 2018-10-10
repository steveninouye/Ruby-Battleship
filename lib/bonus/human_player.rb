require_relative "./player.rb"
require_relative "./board.rb"

class HumanPlayer < Player

  def get_attack
    puts "Where would you like to attack?"
    gets.chomp.split(" ")
  end

  def place_ships
    Board::SHIPS.each do |sym, obj|
      @sym, @name, @size = sym, obj[:name], obj[:size]
      until valid_ship_input
        input = get_ship_input # [start_pos, direction]
        valid_ship_input = validate_ship_input(input)
        place_ship(valid_ship_input) if valid_ship_input
      end
    end
    garbage_collect
  end

  private

  def get_ship_input
    @board.full_display
    puts "Where would you like to place your #{@name}(#{@size})?"
    print "Starting position *space separated >2 3< => "
    start_input = gets.chomp
    print "Direction up(u), down(d), left(l), right(r), (retry) >u< => "
    direction = gets.chomp
    [start_input, direction]
  end
end
