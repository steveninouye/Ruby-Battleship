require_relative "./game.rb"

if __FILE__ == $PROGRAM_NAME
    game = BattleshipGame.new(HumanPlayer, Board.new)

    game.play
end