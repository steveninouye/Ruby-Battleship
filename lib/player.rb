class HumanPlayer

    
    def self.get_play
        target = []
        valid_input = false
        until valid_input
            display_target_directions
            target = input_to_integer_arr(gets.chomp)
            valid_input = input_is_valid?(target)
        end
        target
    end

    def display_target_directions
        p "\n\n"
        p "Target a coordinate"
        p "('3 4' => targets row 3 column 4)"
    end

    def input_to_integer_arr(input)
        num_arr = input.split.map do |el|  
            num = el.to_i
            num if el == "0" || num > 0
            # if input is not a number, it will return nil for the index
        end
        num_arr.compact
    end

    def input_is_valid?(arr)
        if arr.length != 2
            p "Input Valid Target"
            return false
        end
        true
    end
end
