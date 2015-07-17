require "./lib/Players.rb"
require "./lib/GameBoard.rb"
require "./lib/GameModel.rb"
require "./lib/GamePrompt.rb"

class TicTacToeGame
  
  def initialize(game = GameModel.new)
    @game = game
  end
  
  def start(prompt = Prompt.new)
    prompt.intro(@game.current_player.name, @game.mode)

    until @game.is_over
      move = nil
      @game.to_s
      loop do
        (@game.current_player.is_human?) ? (move = prompt.user_move(@game.current_player)) : (move = @game.generate_move)
        break if @game.move_is_valid(move.to_i)
      end
      @game.play(move.to_i)
    end
      #game is now over, print final board 
      @game.to_s
(@game.winner == nil) ? (prompt.game_over_msg) : (prompt.game_over_msg(@game.winner))
  end
end