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
      valid_start_pos = valid_start_pos(input)
    end
    until valid_direction
      print "Direction up(u), down(d), left(l), right(r), (retry) >u< => "
      direction = gets.chomp
      # TODO: "retry"
      valid_input = valid_direction(valid_start_pos, direction, size)
    end
  end

  def valid_start_pos(input)
    arr = input.split
    start_position = arr.map{|el| el.to_i}
    return start_position if start_position == arr && on_board?(start_position)
    puts "Invalid Input"
  end

  def on_board?(pos)
    @board[pos]
  end

  def valid_direction(start_pos, direction, size)
    
  end
end
