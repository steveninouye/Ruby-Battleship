module Num_Input_Validation
  def get_num_input(min, max, str)
    num = nil
    while true
      puts str
      input = gets.chomp
      num = input.to_i if (min.to_s..max.to_s).include?(input)
      break if num
      puts "Enter Valid Number between #{min} and #{max}"
    end
    num
  end
end

module Direction_Validation
  def get_direction
    direction = nil
    while true
      print "What direction would you like your ship?\nup(u), down(d), left(l), right(r)\n=> "
      input = gets.chomp
      direction = input if input.length == 1 && "udlr".include?(input)
      break if direction
      puts "Enter a valid direction u/d/l/r"
    end
    direction
  end
end

module Ship_Pos_Validation
  def validate_ship_input(input)
    case @direction
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
      coord = operation_passer(n)
      if @board[coord] != " "
        puts "Invalid Placement of #{@name}"
        return false
      end
    end
  end
end
