require_relative "./player.rb"
require_relative "./board.rb"

class ComputerPlayer < Player

  def get_attack
    x = rand(0..5)
    y = rand(0..5)
    [x,y]
  end

  def place_ships
    num_rows, num_cols = @grid
    Board::SHIPS.each do |sym, obj|
      @sym, @name, @size = sym, obj[:name], obj[:size]
      until valid_ship_input
        start_pos = "#{rand(0...num_rows)} #{rand(0...num_cols)}"
        direction = ["r", "l", "u", "d"].sample
        valid_ship_input = validate_ship_input([start_pos, direction])
        place_ship(valid_ship_input) if valid_ship_input
      end
    end
    garbage_collect
  end
end
