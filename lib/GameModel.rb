class GameModel
  attr_accessor :total_moves
  
  def initialize(mode, starting_player)
    @board = GameBoard.new
    @total_moves = 0

    if (mode = 1)
      @player1 = Human.new
      @player2 = Computer.new
    elsif (mode = 2)
      @player1 = Human.new
      @player2 = Human.new
    elsif (mode = 3)
      @player1 = Computer.new
      @player2 = Computer.new
    end
    
    if (starting_player == 1)
      @player1.started = true
    else
      @player2.started = true
    end
    
    puts "Great! Now everything is set up, lets start the game!"
    puts "-----------------------------------------------------"
  end

  #main method to make a move, if the user is a human, then it will prompt the user for their move
  def make_move
    if current_player_is_computer
      make_computer_move()
    else
      print_game_board()
      print "\n#@current_player, where would you like to make your move? (Choose 1 -> 9)\n"
      
      loop do
        print "> "
        @move = Integer(gets.chomp)
        break if move_is_valid(@move)
      end
      
      play_move(@move)
    end
    
    if (@game_moves[:total_moves] > 2) 
        check_next_to_win_move
    end
    change_turn()
  end
  
  #method to check if a given move is legal or illegal
  def move_is_valid(input)
    return true if @board.is_empty?(input)
    
    return false
  end
  
  #method returns true or false if game is over
  def is_over
    result = false
    
    # game is over if there's a winning move or there have been 9 game moves
    if winning_move
      result = true
    elsif @total_moves == 9
      result = true
      @win_message = "Draw game!"
    end
    
    return result
  end
end