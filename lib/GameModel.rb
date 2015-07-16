class GameModel
  def initialize(prompt = Prompt.new, init = nil)
    @gb = GameBoard.new
    @prompt = prompt
    @player1 = init.player1
    @player2 = init.player2
    @total_moves = 0
    
    (@player1.starts) ? @current_player = @player1 : @current_player = @player2
    
    @prompt.intro(@current_player.name, init.mode)
  end

  #main method to make a move, if the user is a human, then it will prompt the user for their move
  def make_move
    if @current_player.is_human?
      #prompt user for move
      print "\n#@current_player, where would you like to make your move? (Choose 1 -> 9)\n"
      
      loop do
        print "> "
        @move = Integer(gets.chomp)
        break if move_is_valid(@move)
      end
    end
    
    #put their game peice on the board
  end
  
  #method to check if a given input move is legal or illegal
  def move_is_valid(input)
    (@gb.is_empty?(input)) ? result = true : result = false
    return result
  end
  
  #method returns true or false if game is over
  def is_over
    result = false
    
    # game is over if there's a winning move or there have been 9 game moves
    if gb.winning_move?
      result = true
      # prompt for win message
    elsif @total_moves == 9
      result = true
      # @win_message = "Draw game!"
    end
    
    return result
  end
end