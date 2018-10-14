module Num_Input_Validation
  def get_num_input(min, max, str)
    num = nil
    while true
      puts str
      input = gets.chomp
      num = input.to_i if (min.to_s..max.to_s).include?(input)
      break if num
      puts "INVALID INPUT::Enter Valid Number between #{min} and #{max}"
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
      puts "INVALID INPUT::Enter a valid direction u/d/l/r"
    end
    direction
  end
end

module Ship_Pos_Validation
  def validate_ship_input
    case @direction
      when "r"
        @col = false
        @operator = "+"
        return valid_placement
      when "l"
        @col = false
        @operator = "-"
        return valid_placement
      when "u"
        @col = true
        @operator = "-"
        return valid_placement
      when "d"
        @col = true
        @operator = "+"
        return valid_placement
      else
      puts "Invalid Direction"
      return false
    end
  end

  def valid_placement
    @size.times do |n|
      row, col = calculate_coord(n)
      unless (0...@board.num_rows).include?(row) &&
            (0...@board.num_cols).include?(col) &&
            @board[[row, col]] == " "
        puts "INPUT INVALID::Invalid Placement of #{@ship_name}"
        return false
      end
    end
    [@start_pos, @direction]
  end
end

module Player_Name_Validation
  def get_valid_name
    valid_name = nil
    until valid_name
      valid_name = gets.chomp unless @players.any? { |player| player.name == name }
    end
    valid_name
  end
end
