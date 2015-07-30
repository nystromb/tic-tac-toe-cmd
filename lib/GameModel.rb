class GameModel
  attr_reader :p1, :p2

  def initialize(game_mode, starting_player)
    @game = GameBoard.new
    init_players(game_mode, starting_player)
  end
  
  def init_players(game_mode, starting_player)
    @p1 = Player.new
    @p2 = Player.new
    
    if game_mode == 1
      @mode = "Human v. Computer"
      @p2.human = false
    elsif game_mode == 2
      @mode = "Human v. Human"
    elsif game_mode == 3 
      @mode = "Computer v. Computer"
      @p1.human = false
      @p2.human = false
    end
    
    if (starting_player == 1)
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
  
  def start(prompt)
    prompt.intro(@game.current_player, @mode)
    prompt.to_s(@game.board)
    
    until @game.is_over?
      move = nil
      loop do
        if (@game.current_player.human) 
          move = prompt.user_move(@game.current_player)
        else
          prompt.computer_move
          move = generate_move(@game.clone)
        end 
        break if @game.move_is_valid(move.to_i)
      end
      prompt.chosen(@game.current_player, move)
      @game.play(move.to_i , @game.current_player.peice)
      set_opponent(@game)  
      prompt.to_s(@game.board)
    end
    (@game.winner == nil) ? (prompt.game_over_msg) : (prompt.game_over_msg(@game.winner))
  end

  def set_opponent(game)
    (game.current_player == @p1) ? (game.current_player = @p2) : (game.current_player = @p1)
  end

  def generate_move(node, outcomes = {}, depth = 0)
    return score(node, depth) if node.is_over?
    moves = node.get_empty_locs
    moves.each do |move|
      node.play(move, node.current_player.peice)
      set_opponent(node)
      new_node = node.clone
      outcomes[move] = generate_move(new_node, {}, depth + 1)
      node.play(move, nil)
    end
    
    move = nil
    if(node.current_player.peice == "X")
      best = -100
      outcomes.each { |m, score| best, move = score, m if (score > best) }
    else
      best = 100
      outcomes.each { |m, score| best, move = score, m if (score < best) }
    end
    
    # print "#{outcomes} #{node}" if depth == 0
    
    (depth == 0) ? (return move) : (return best)    
  end
  
  def score(game, depth)
    if game.winner == "X"
      return depth - 10
    elsif game.winner == "O"
      return 10 - depth
    elsif game.winner.nil?
      return 0
    end
  end


end