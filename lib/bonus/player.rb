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
    @board.reduce(0) { |a,row| a + row.count {|e| e.class == Symbol} }
  end

  def defeated?
    count == 0
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
    # TODO: clear screen
    [:@sym, :@name, :@size, :@operator, :@start_pos, :@row_col].each {|e| remove_instance_variable(e)}
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

  def validate_ship_input(input)
    start_input, direction = input
    @start_pos = start_input.split.map {|e| e.to_i}
    if @start_pos.length != 2 || "#{@start_pos[0]} #{@start_pos[1]}" != start_input
      puts "Invalid Start Position"
      return false
    end
    case direction
      when "r"
        @row_col = [0, @size]
        @operator = "+"
        validate_placement
      when "l"
        @row_col = [0, @size]
        @operator = "-"
        validate_placement
      when "u"
        @row_col = [@size, 0]
        @operator = "-"
        validate_placement
      when "d"
        @row_col = [@size, 0]
        @operator = "+"
        validate_placement
      when "retry"
        return false
      else
      puts "Invalid Direction"
      return false
    end
    [@start_pos, direction]
  end

  def validate_placement
    row, col = @start_pos
    @size.times do |n|
      if @board[operation_passer] != " "
        puts "Invalid Placement of #{@name}"
        return false
      end
    end
  end

  def operation_passer
    row, col = @start_pos
    [row.send(@operator, @row_col[0]), col.send(@operator, @row_col[1])]
  end

  def place_ship(input)
    @size.times do |n|
      @board[operation_passer] = @sym
    end
  end
end
