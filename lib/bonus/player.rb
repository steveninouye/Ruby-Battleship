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
        input = get_ship_input # [start_pos, direction]
        valid_ship_input = validate_ship_input(input)
        place_ship(valid_ship_input) if valid_ship_input
      end
    end
    [:@ship, :@operator, :@start_pos].each {|e| remove_instance_variable(e)
  end

  private

  def get_ship_input
    puts "Where would you like to place your #{@ship.name}(#{@ship.size})?"
    print "Starting position *space separated >2 3< => "
    start_pos = gets.chomp
    print "Direction up(u), down(d), left(l), right(r), (retry) >u< => "
    direction = gets.chomp
    [start_input, direction]
  end

  def validate_ship_input(input)
    start_input, direction = input
    @start_pos = start_input.split.map {|e| e.to_i}
    if @start_pos.length != 2 || "#{@start_pos[0]} #{@start_pos[1]}" != start_input
      puts "Invalid Start Position"
      return false
    end
    if direction != "retry" && (direction.length != 1 || !"udlr".include?(direction))
      puts "Invalid Direction"
      return false
    end
    case direction
      when "r"
        @operator = "+"
        validate_placement
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
    [start_pos, direction]
  end

  def validate_placement(start_pos, operator)
    row, col = start_pos
    @shipt.size.times do |n|
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
