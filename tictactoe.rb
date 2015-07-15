require "./lib/Players.rb"
require "./lib/GameBoard.rb"
require "./lib/GameModel.rb"
require "./lib/GamePrompt.rb"

def start(game)
  until game.is_over
    game.make_move
  end
end

if __FILE__ == $0
  gp = Prompt.new
  
  #check for command line args
  if (ARGV.length == 2)
    gm = Integer(ARGV[0])
    fp = Integer(ARGV[1])
    start(GameModel.new(gm, fp)) if (gm >= 1 && gm <= 3) && (fp == 1 || fp == 2)
  end
  
  if (ARGV.length == 0)
    gm = gp.for_game_mode
    fp = gp.for_starting_player
    start(GameMode.new(gm, fp))
  end
end