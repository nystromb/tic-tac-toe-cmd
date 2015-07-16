require "./lib/Players.rb"
require "./lib/GameBoard.rb"
require "./lib/GameModel.rb"
require "./lib/GamePrompt.rb"
require "./lib/GameInit.rb"

def start(prompt, game)
  prompt.intro(game.current_player.name, game.mode)

  until game.is_over
    move = nil
    game.board_print
    loop do
      (game.current_player.is_human?) ? (move = prompt.user_move(game.current_player)) : (move = game.generate_move)
      break if game.move_is_valid(move)
    end
    game.play(move)
  end
  #game is now over, print final board 
  game.board_print
  (game.last_move == nil) ? (prompt.game_over_msg) : (prompt.game_over_msg(game.last_move))
end

if __FILE__ == $0
  prompt = Prompt.new
  init = GameInit.new
  
  #check for command line args
  if (ARGV.length == 2) && (init.check_args(ARGV[0], ARGV[1]))
    init.game_mode = ARGV[0].to_i
    init.first_player = ARGV[1].to_i
    init.ready = true
  elsif (ARGV.length == 0) # prompt the user for input
    init.game_mode = prompt.for_game_mode
    init.first_player = prompt.for_starting_player
    init.ready = true
  end
  
  unless init.ready
    puts "USAGE MESSAGE"
  else
    start(prompt, GameModel.new(init))
  end
  
end