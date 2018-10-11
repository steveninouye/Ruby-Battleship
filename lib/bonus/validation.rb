module Validation
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
