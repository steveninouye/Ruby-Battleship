class HumanPlayer

    
    def self.get_play
        input = gets.chomp.split(",").map do |el|  
            if el == "0"
                0
            elsif el.to_i > 0
                el.to_i
            end
        end
        target = input.compact
        target if target.length == 2
    end
end
