require_relative "./player.rb"
require_relative "./board.rb"
require "byebug"

class ComputerPlayer < Player

  def initialize (name, board)
    @name = name
    @board = Board.new(board)
  end

  def create_enemy_boards(all_players, board)
    @enemy_boards = Board.new(board)
    @next_attack_coord = get_random_coord
  end

  def display_enemy_boards
    @enemy_boards.display ################
    @next_attack_coord = nil
    hits = @enemy_boards.get_all_coord_val.reject { |k,v| v == " " }
    hits = hits.sort { |a, b| a[1] <=> b[1] }
    until @next_attack_coord
      if hits.length == 0
        until @next_attack_coord
          coord = get_random_coord
          @next_attack_coord = coord if @board[coord] == " "
        end
      else
        highest_num_hits = hits.last[1]
        coords = hits.reduce([]) do |a,c|
          a << c[0] if c[1] == highest_num_hits
          a
        end
        @next_attack_coord = find_next_attack(coords)
        hits.reject! { |el| el[1] == highest_num_hits }
      end
    end
    @next_attack_coord
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

  def find_next_attack(coords)
    attack_pos = nil
    while !attack_pos && coords.length > 0
      coord = coords.shuffle!.shift
      attack_pos = get_attack_coord(coord)
    end
    attack_pos
  end

  def get_attack_coord(coord)
    row, col = coord
    # byebug
    surrounding_points = [[row - 1, col], [row + 1, col], [row, col - 1], [row, col + 1]]
    surrounding_points.shuffle!
    surrounding_points.each do |point|
      return point if @enemy_boards[point] == " "
    end
    nil
  end

  def get_random_coord
    coord = false
    while !coord || @board[coord] != " "
      row = rand(0...@board.num_rows)
      col = rand(0...@board.num_cols)
      coord = [row, col]
    end
    coord
  end
end
