class HumanPlayer

    
    def self.get_play
        target = []
        while true
            input = gets.chomp.split(",").map do 
            break if target.length == 2
            p "Input valid target"
        end
        target
    end

    def input_to_integer_arr(input)
        num_arr = input.split(",").map do |el|  
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
