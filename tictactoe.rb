require "./lib/Players.rb"
require "./lib/GameBoard.rb"
require "./lib/GameModel.rb"
require "./lib/GamePrompt.rb"

if __FILE__ == $0
  gp = Prompt.new
  #check for game settings
  if (ARGV.length == 2)
    gm = Integer(ARGV[0])
    fp = Integer(ARGV[1])
    
    if (mode > 0 && mode <= 3) && (start > 0 && start <= 2)
      @game = GameModel.new(mode, start)
    end
  end
  
  if (ARGV.length == 0)
      gm = gp.for_game_mode
      fp = gp.for_starting_player
      @game = GameModel.new(gm, fp)
  end
  
  #loop through until the game over status is true
  #until game.is_over()
    #game.make_move()
  #end
end