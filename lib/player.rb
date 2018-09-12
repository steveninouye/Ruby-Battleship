class HumanPlayer
    def self.get_play
        gets.chomp.split(",").map { |el| Integer(el) }
    end
end
