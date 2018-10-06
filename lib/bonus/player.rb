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
    valid_input = false
    until valid_input
      puts "Where would you like to place your #{name}(#{size})?"
      print "Starting position   => "
      start_position = gets.chomp
      print "Direction up(u), down(d), left(l), right(r) => "
      ship_direction = gets.chomp
      valid_input = valid_ship_pos?(start_position, ship_direction, ship.size)
    end

  end

  def valid_ship_pos?(start_position, ship_direction, size)

  end
end
