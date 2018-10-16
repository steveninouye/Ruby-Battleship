require_relative "./classes/game.rb"

if __FILE__ == $PROGRAM_NAME
    game = Game.new
    game.play
end
