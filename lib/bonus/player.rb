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
      valid_input = false
      until valid_input
        puts "Where would you like to place your #{ship.name}(#{ship.size})?"
        print "Starting position => "
        start_pos = gets.chomp
        print "End position => "
        end_pos = gets.chomp
      end
    end
  end

  def valid_ship_pos?(start_pos, end_pos, size)

  end
end
