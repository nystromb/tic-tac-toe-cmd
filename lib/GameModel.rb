class GameModel
  attr_accessor :mode
  attr_accessor :current_player
  attr_accessor :total_moves
  attr_reader :last_move
  
  def initialize(settings = GameInit.new)
    @board = GameBoard.new
    @player1, @player2 = settings.players
    @last_move = nil
    @mode = settings.mode
    @total_moves = 0
    (@player1.starts) ? @current_player = @player1 : @current_player = @player2
  end
  
  def play(move)
    @board.play_move(move.to_i, @current_player.peice)
    @last_move = @current_player
    @total_moves += 1
    change_turns
  end
  
  #method to check if a given input move is legal or illegal
  def move_is_valid(input)
    return @board.is_empty?(input.to_i) 
  end
  
  #method returns true or false if game is over
  def is_over
    if (@board.winning_move?)
      return true
    elsif (@total_moves == 9)
      @last_move = nil
      return true
    else
      return false
    end
  end
    
  def change_turns
    (@current_player == @player1) ? @current_player = @player2 : @current_player = @player1
  end
  
  def board_print
    @board.to_s
  end
end