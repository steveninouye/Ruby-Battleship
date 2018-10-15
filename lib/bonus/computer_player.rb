require_relative "./player.rb"
require_relative "./board.rb"

class ComputerPlayer < Player

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
    @past_attack_coord = []
  end

  def create_enemy_boards(all_players, board)
    @enemy_boards = Board.new(board)
    @next_attack_coord = get_random_coord
  end

  def display_enemy_boards # tells computer where to target next
    # find coordinate with most hits && available adjacent spots to target
    # hit adjacent spot
    @next_attack_coord = get_random_coord # Easy Setting
  end

  def get_attack
    @next_attack_coord
  end

  def get_direction
    ["u","d","l","r"].sample
  end

  def get_start_pos
    row = rand(0...@board.num_rows)
    col = rand(0...@board.num_cols)
    [row, col]
  end

  def log_attack(attack_log, coord)
    num_hits = count_hits(attack_log)
    @enemy_boards[coord] = num_hits
  end

  private

  def count_hits(attack_log)
    attack_log.count {|name, result| result == :hit}
  end

  def get_random_coord
    coord = false
    while !coord || @past_attack_coord.include?(coord)
      row = rand(0...@board.num_rows)
      col = rand(0...@board.num_cols)
      coord = [row, col]
    end
    coord
  end
end
