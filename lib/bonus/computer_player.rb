require_relative "./player.rb"
require_relative "./board.rb"

class ComputerPlayer < Player

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
    @enemy_boards = {}
    @past_attack_coord = []
  end

  def display_enemy_boards # tells computer where to target next
    # find coordinate with most hits && available adjacent spots to target
    # hit adjacent spot
  end

  def get_attack
    coord = false
    while !coord || @past_attack_coord.include?(coord)
      row = rand(0...@board.num_rows)
      col = rand(0...@board.num_cols)
      coord = [row, col]
    end
    @past_attack_coord.push(coord)
    coord
  end

  def get_direction
    ["u","d","l","r"].sample
  end

  def get_start_pos
    row = rand(0...@board.num_rows)
    col = rand(0...@board.num_cols)
    [row, col]
  end
end
