class GameModel
  def initialize(prompt = Prompt.new, player1 = Human.new, player2 = Human.new, mode = "Human v. Computer")
    @gb = GameBoard.new
    @prompt = prompt
    @player1 = player1
    @player2 = player2
    @total_moves = 0
    (@player1.starts) ? @current_player = @player1 : @current_player = @player2
    
    @prompt.intro(@current_player.name, mode)
  end

  #main method to make a move, if the user is a human, then it will prompt the user for their move
  def make_move
    @gb.to_s
    
    if @current_player.is_human?
      move = @prompt.user_move(@current_player.name)
      until move_is_valid(move)
        print "> "
        move = gets.chomp
      end
    else #computer must make a move
      
    end
    
    @gb.play_move(move.to_i, @current_player.peice)
    @total_moves += 1
    change_turns
  end
  
  def change_turns
    (@current_player == @player1) ? @current_player = @player2 : @current_player = @player1
  end
  
  #method to check if a given input move is legal or illegal
  def move_is_valid(input)
    return @gb.is_empty?(input.to_i) 
  end
  
  #method returns true or false if game is over
  def is_over
    result = false
    
    # game is over if there's a winning move or there have been 9 game moves
    if @gb.winning_move?
      result = true
      # prompt for win message
    elsif @total_moves == 9
      result = true
      # @win_message = "Draw game!"
    end
    
    return result
  end
end