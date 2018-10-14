require_relative "./computer_player.rb"
require_relative "./human_player.rb"
require_relative "./modules/validation.rb"
require "byebug"

class Game

  def initialize
    @players = []
  end

  def play
    game_setup
    until game_over?
      @current_player = @players.shift
      take_turn
      @players << @current_player
    end
    puts "#{@players[0].name} is the WINNER!"
  end

  private

  include Num_Input_Validation

  def attack(coord)
    attack_log = {}
    @players.each_with_index do |player,idx|
      result = player.post_attack(coord)
      attack_log[player] = result
      destroy(player) if player.defeated?
    end
    @current_player.log_attack(attack_log)
  end

  def create_comp_players
    num_comp_players = get_num_input(0, 10, "How many Computer Players would you like?")
    num_comp_players.times do |el|
      comp_name = "Computer#{el + 1}"
      create_player(comp_name, ComputerPlayer)
    end
  end

  def create_human_players
    num_human_players = get_num_input(0, 10, "How many *Human Players* will be playing?")
    num_human_players.times do |el|
      puts "Player #{el + 1} name:"
      player_name = gets.chomp
      create_player(player_name, HumanPlayer)
    end
  end

  def create_enemy_boards
    @players.each do |player|
      player.create_enemy_boards(@players, @board)
    end
  end

  def create_player(name, class_name)
    @players << class_name.new(name, @board)
    puts "#{name} was added"
    @players[-1].place_ships
    puts "#{name} placed their ships"
  end

  def destroy(player)
    puts "#{player.name} was destroyed"
    @players.delete(player)
  end

  def finish_turn
    print "Press ENTER to complete your turn"; gets
    system "clear"
  end

  def game_over?
    @players.length == 1
  end

  def game_setup
    num_rows = get_num_input(10, 100, "How many rows on the board?")
    num_columns = get_num_input(10, 100, "How many columns on the board?")
    @board = [num_rows, num_columns]
    create_human_players
    create_comp_players
    create_enemy_boards
    shuffle_players
    remove_instance_variable(:@board)
  end

  def shuffle_players
    puts "Shuffling Players"
    @players = @players.shuffle
  end

  def take_turn
    puts "#{@current_player.name}'s turn"
    coord = @current_player.get_attack
    attack(coord)
    finish_turn
  end
end
