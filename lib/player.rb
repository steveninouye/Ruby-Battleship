class HumanPlayer

    
    def self.get_play
        input = gets.chomp.split(",").map { |el| Integer(el) }
        int_arr = input.split(" ").map do |el|
            if el == "0"
                0
            elsif el.to_i > 0
                el.to_i
            end
        end
        target = int_arr.compact
        target if target.length == 2
    end
end
