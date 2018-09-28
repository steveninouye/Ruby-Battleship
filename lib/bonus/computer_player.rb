require_relative "./player.rb"

class ComputerPlayer < Player

  def get_attack
    x = rand(0..5)
    y = rand(0..5)
    [x,y]
  end
end