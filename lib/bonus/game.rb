require_relative "./computer_player.rb"
require_relative "./human_player.rb"

class Game
  
  def initialize
    @players = []
  end

  def play
    setup
    until game_over?
      @current_player = @players.unshift[0]
      take_turn
      @players << @current_player
    end
    puts "#{@players[0].name} is the WINNER!"
  end

  private

  def setup
    num_rows = get_num_input(20, "How many rows on the board?")
    num_columns = get_num_input(20, "How many columns on the board?")
    board = [num_rows, num_columns]
    create_human_players(board)
    create_comp_players(board)
    shuffle_players
  end

  def take_turn
    puts "#{@current_player.name}'s turn"
    coord = @current_player.get_attack
    attack(coord)
  end

  def attack(coord)
    @players.each_with_index do |player,idx|
      player.post_attack(coord)
      if player.defeated?
        @players.delete_at(idx)
        puts "#{player.name} was destroyed!"
      end
    end
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

  def create_human_players(board)
    num_human_players = get_num_input(10, "How many players will be playing?")
    num_human_players.times do |el|
      puts "Player #{el + 1} name:"
      player_name = gets.chomp
      @players << HumanPlayer.new(player_name, Board.new(board))
      puts "#{player_name} was added"
    end
  end

  def create_comp_players(board)
    num_comp_players = get_num_input(10, "How many computers would you like?")
    num_comp_players.times do |el|
      comp_name = "Computer#{el + 1}"
      @players << ComputerPlayer.new(comp_name, Board.new(board))
      puts "#{comp_name} was added"
    end
  end

  def shuffle_players
    puts "Shuffling Players"
    @players = @players.shuffle
  end

  def game_over?
    @players.length == 1
  end
end