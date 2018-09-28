require_relative "./player.rb"

class HumanPlayer < Player

  def get_attack
    puts "Where would you like to attack?"
    gets.chomp.split(" ")
  end


end