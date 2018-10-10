require_relative "./board.rb"
require_relative "./ship.rb"

class Player
  attr_reader :name

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
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
    system "clear"
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
        @row = true
        @operator = "+"
        validate_placement
      when "l"
        @row = true
        @operator = "-"
        validate_placement
      when "u"
        @row = false
        @operator = "-"
        validate_placement
      when "d"
        @row = false
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
    @size.times do |n|
      if @board[operation_passer(n)] != " "
        puts "Invalid Placement of #{@name}"
        return false
      end
    end
  end

  def operation_passer(n)
    row, col = @start_pos
    row = row.send(@operator, n) if @row
    col = col.send(@operator, n) if !@row
    [row, col]
  end

  def place_ship(input)
    @size.times do |n|
      @board[operation_passer(n)] = @sym
    end
  end
end
