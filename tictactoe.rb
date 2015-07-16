require "./lib/Players.rb"
require "./lib/GameBoard.rb"
require "./lib/GameModel.rb"
require "./lib/GamePrompt.rb"
require "./lib/GameInit.rb"

def start(game)
  #until game.is_over
    #game.make_move
  #end
end

if __FILE__ == $0
  prompt = Prompt.new
  init = GameInit.new(prompt)
  
  #check for command line args
  if (ARGV.length == 2) && (init.cmd_line_args(ARGV[0], ARGV[1]))
    mode = ARGV[0].to_i
    fp = ARGV[1].to_i
    init.ready = true
  elsif (ARGV.length == 0) # prompt the user for input
    mode = prompt.for_game_mode
    fp = prompt.for_starting_player
    init.ready = true
  end
  
  unless init.ready
    puts "USAGE MESSAGE"
  else
    init.players(mode, fp)
    start(GameModel.new(prompt, init))
  end
  
end