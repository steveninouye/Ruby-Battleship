require_relative "./computer_player.rb"
require_relative "./human_player.rb"
require_relative "./board.rb"

class Game
  # infinite number of players possible
  def initialize
    @players = []
  end

  def play
    setup
    until game_over?
      current_player = @players.unshift
      #get players attack coordinate
      #attack all other players

      #find out if any players have been defeated && notify other players

      @players << current_player
    end
    #diplay winning player
  end

  def setup
    #get num of rows
    num_rows = get_num_input(20, "How many rows on the board?")
    #get num columns
    num_columns = get_num_input(20, "How many columns on the board?")
    board = [num_rows, num_columns]

    #get the number of players
    num_human_players = get_num_input(10, "How many players will be playing?")
    #create the players
    create_human_players(num_human_players, board)
    #get num of computer players
    num_comp_players = get_num_input(10, "How many computers would you like?")
    #create computer players
    create_comp_players(num_comp_players, board)
    #scramble order
  end

  def get_num_input(max, str)
    num = nil
    while true
      puts str
      input = gets.chomp
      num = input.to_i if ("0"..max.to_s).include?(input)
      break if num
      puts "Enter Valid Number between 0 and #{max}"
    end
    num
  end

  def create_human_players(num, board)
    num_human_players.times do |el|
      puts "Player #{el + 1} name:"
      @players << HumanPlayer.new(gets.chomp, Board.new(board))
    end
  end

  def create_comp_players(num, board)
    num_human_players.times do |el|
      comp_name = "Computer#{el+1}"
      @players << ComputerPlayer.new(comp_name, Board.new(board))
      puts "Computer#{}"
    end
  end

  def game_over?
    #no ships on one of the boards
  end
end