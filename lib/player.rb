class HumanPlayer

    
    def self.get_play
        target = []
        while true
            input = gets.chomp.split(",").map do |el|  
                if el == "0"
                    0
                elsif el.to_i > 0
                    el.to_i
                end
            end
            target = input.compact
            break if target.length == 2
            p "Input valid target"
        end
        target
    end

    def input_to_integer(input)
        
    end
end
