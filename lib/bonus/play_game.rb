require_relative "./game.rb"

if __FILE__ == $PROGRAM_NAME
    game = Game.new
    game.play
end