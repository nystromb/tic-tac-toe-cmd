class TicTacToeGame
  
  def initialize(mode = 2, sp = 1, game = GameModel.new)
    @game = game
      
    case mode
    when 1
      @mode = "Human v. Computer"
      p1 = Player.new
      p2 = Computer.new
    when 2
      @mode = "Human v. Human"
      p1 = Player.new
      p2 = Player.new
    when 3
      @mode = "Computer v. Computer"
      p1 = Computer.new
      p2 = Computer.new
    end

    if (sp == 1)
      p1.starts = true
      p1.peice = "X"
      p2.peice = "O"
    else
      p2.starts = true
      p2.peice = "X"
      p1.peice = "O"
    end
    
    @game.set_players(p1, p2)
      
    start
  end
  
  def start(prompt = Prompt.new)
    prompt.intro(@game.current_player, @mode)
    @game.to_s
    
    until @game.is_over?
      move = nil
      
      loop do
        if (@game.current_player.is_human?) 
          move = prompt.user_move(@game.current_player)
        else
          prompt.computer_move
          move = @game.current_player.generate_move(@game.clone)
          
          @game.get_empty_locs.each do |m|
            move = m if @game.next_win?(m, @game.get_opponent)
            move = m if @game.next_win?(m, @game.current_player.peice)
          end
          
        end 
        break if @game.move_is_valid(move.to_i)
      end
      prompt.chosen(@game.current_player, move)
      @game.play(move.to_i)
      @game.to_s
    end
    (@game.winner == nil) ? (prompt.game_over_msg) : (prompt.game_over_msg(@game.winner))
  end
end