require "./lib/Player.rb"
require "./lib/GameBoard.rb"
require "./lib/GamePrompt.rb"
require "./lib/GameModel.rb"

if __FILE__ == $0 
  prompt = Prompt.new
  ready = false
  fplyr = nil
  mode = nil
  #check for command line args
  if (ARGV.length == 2)
    mode = ARGV[0].to_i
    fplyr = ARGV[1].to_i
    ((fplyr == 1 || fplyr == 2) && (mode >= 1 && mode <= 3)) ? ready = true : (prompt.usage)
  elsif (ARGV.length == 0) # prompt the user for input
    mode = prompt.for_game_mode
    fplyr = prompt.for_starting_player
    ready = true
  end
  
  GameModel.new(mode, fplyr).start(prompt) if ready
end