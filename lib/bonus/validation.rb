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

module Ship_Pos_Validation
  def validate_ship_input(input)
    start_input, direction = input
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
end
