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
      @ship = Ship.new(name)
      until valid_ship_input
        @input = get_ship_input # [start_pos, direction]
        valid_ship_input = validate_ship_input(@input)
        place_ship(@input) if valid_ship_input
      end
    end
  end

  private

  def get_ship_input
    puts "Where would you like to place your #{@ship.name}(#{@ship.size})?"
    print "Starting position *space separated >2 3< => "
    start_pos = gets.chomp
    print "Direction up(u), down(d), left(l), right(r), (retry) >u< => "
    direction = gets.chomp
    [start_pos, direction]
  end

  def validate_ship_input(input)
    start_pos, direction = input
    row, col = start_pos
    case direction
      when "r"
        check_placement
        place_ship
        # check if 'size - 1' spaces to the right are == ""
        size.times do |n|
          if @board[row, col + n] != ""
            puts "Invalid Input"
            return false
          end
        end
        size.times do |n|
          @board[row, col + n] = :O
        end
      when "l"
        size.times do |n|
          if @board[row, col - n] != ""
            puts "Invalid Input"
            return false
          end
        end
        size.times do |n|
          @board[row, col - n] = :O
        end
      when "u"
        size.times do |n|
          if @board[row - n, col] != ""
            puts "Invalid Input"
            return false
          end
        end
        size.times do |n|
          @board[row - n, col] = :O
        end
      when "d"
        size.times do |n|
          if @board[row + n, col] != ""
            puts "Invalid Input"
            return false
          end
        end
        size.times do |n|
          @board[row + n, col] = :O
        end
      when "retry"
        # TODO: "retry"
      else
      puts "Invalid Input"
      return false
    end
  end

  def validate_place(size)
    size.times do |n|
      if @board[row - n, col] != ""
        puts "Invalid Input"
        return false
      end
    end
  end

  def operation_passer(row, col, row_num, col_num, oper)
    [row.send(oper, row_num), col.send(oper, col_num)]
  end
end
