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
    #get num columns


    #get the number of players
    num_human_players = get_num_input(10, "How many players will be playing?")
    #create the players
    create_human_players(num_human_players)
    #get num of computer players
    num_comp_players = get_num_input(10, "How many computers would you like?")
    #create computer players
    create_comp_players(num_comp_players)
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

  def create_human_players(num)
    num_human_players.times do |el|
      puts "Player #{el + 1} name:"
      @players << HumanPlayer.new(gets.chomp)
    end
  end

  def create_comp_players(num)
    num_human_players.times do |el|
      puts "Player #{el + 1} name:"
      @players << ComputerPlayer.new
    end
  end

  def game_over?
    #no ships on one of the boards
  end
end