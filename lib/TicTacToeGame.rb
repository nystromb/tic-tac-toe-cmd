class TicTacToeGame
  
    def initialize(mode = 2, sp = 1, game = GameModel.new)
      @game = game
      @m = mode
      init_players(@m, sp)
      start
    end
    
    def init_players(mode, sp)
      case mode
      when 1
        @mode = "Human v. Computer"
        @p1 = Player.new
        @p2 = Computer.new
      when 2
        @mode = "Human v. Human"
        @p1 = Player.new
        @p2 = Player.new
      when 3
        @mode = "Computer v. Computer"
        @p1 = Computer.new
        @p2 = Computer.new
      end

      if (sp == 1)
        @p1.starts = true
        @p1.peice = "X"
        @p2.peice = "O"
      else
        @p2.starts = true
        @p2.peice = "X"
        @p1.peice = "O"
      end
    
      (@p1.starts) ? @game.current_player = @p1 : @game.current_player = @p2
  end
  
  def change_turns(game)
    (game.current_player == @p1) ? game.current_player = @p2 : game.current_player = @p1
  end

  def start(prompt = Prompt.new)
    prompt.intro(@game.current_player, @game.mode)

    until @game.is_over?
      move = nil
      @game.to_s
      loop do
        if (@game.current_player.is_human?) 
          move = prompt.user_move(@game.current_player)
        else
          prompt.computer_move
          generate_move(@game)            
        end 
        break if @game.move_is_valid(move.to_i)
      end
      @game.play(move.to_i, @game.current_player.peice)
      change_turns(@game)
    end
    #game is now over, print final board 
    @game.to_s
    (@game.winner == nil) ? (prompt.game_over_msg) : (prompt.game_over_msg(@game.winner))
  end

  def generate_move(node, outcomes = {}, depth = 0)
    return score(node, depth) if node.is_over?
    puts node.inspect
    moves = node.get_empty_locs
    
    moves.each do |move|
      (node.spots_filled.even?) ? node.play(move, "X") : node.play(move, "O")
      node = GameModel.new(node.board)
      node.to_s
      outcomes[move] = generate_move(node, outcomes, depth + 1)
      node.play(move, nil)
    end
    
    print "OCS: #{outcomes} \n"
  end
  
  def score(game, depth)
    puts "GAME WINNER: #{game.winner}"
    case game.winner
    when "X"
      return 10 - depth
    when "O"
      return depth - 10
    when nil
      return 0
    end
  end
end