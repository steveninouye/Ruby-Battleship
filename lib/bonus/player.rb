require_relative "./board.rb"
require_relative "./ship.rb"

class Player
  attr_reader :name

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
  end

  def get_attack
    puts "#{@name}: what row would you like to attack?"
    row = gets.chomp
    puts "#{@name}: what column would you like to attack?"
    col = gets.chomp
  end

  def post_attack(coord)
    row, col = coord
    @board[row, col] = :X
  end

  def count
    @board.reduce(0) { |a,row| a + row.count(:O) }
  end

  def defeated?
    count == 0
  end

  def place_ships
    Ship::SHIPS.keys.each do |name|
      ship = Ship.new(name)
      get_ship_input(ship.size, ship.name)
      place_ship(ship)
    end
  end

  private

  def get_ship_input(size, name)
    valid_start_pos, valid_direction = false, false
    puts "Where would you like to place your #{name}(#{size})?"
    until valid_start_pos
      print "Starting position *space separated >2 3< => "
      input = gets.chomp
      valid_start_pos = validate_start_pos(input)
    end
    until valid_direction
      print "Direction up(u), down(d), left(l), right(r), (retry) >u< => "
      direction = gets.chomp
      valid_direction = validate_direction(valid_start_pos, direction, size)
    end
  end

  def validate_start_pos(input)
    arr = input.split
    start_position = arr.map{|el| el.to_i}
    return start_position if start_position == arr && @board[pos] == ""
    puts "Invalid Input"
  end

  def validate_direction(start_pos, direction, size)
    end_row, end_col = start_pos
    case direction
      when "r"
        end_col += size
      when "l"
        end_col -= size
      when "u"
        end_row -= size
      when "d"
        end_row += size
      when "retry"
        # TODO: "retry"
      else
      puts "Invalid Input"
      return false
    end
    end_pos = [end_row, end_col]
    validate_ship_placement(start_pos, end_pos)
  end

  def validate_ship_placement(start_pos, end_pos)

  end
end
