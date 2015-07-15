class GameModel
  
  def initialize(mode, starting_player)
    @gb = GameBoard.new
    @total_moves = 0

    if (mode == 1)
      puts "\nSelected Mode: 1 Player mode.\n"
      @player1 = Human.new
      @player2 = Computer.new
    elsif (mode == 2)
      puts "\nSelected Mode: 2 Player mode.\n"
      @player1 = Human.new
      @player2 = Human.new
    elsif (mode == 3)
      puts "\nSelected Mode: automated mode.\n"
      @player1 = Computer.new
      @player2 = Computer.new
    end
    
    if (starting_player == 1)
      @player1.started = true
      @current_player = @player1
    else
      @player2.started = true
      @current_player = @player2
    end

    puts "\nGreat! Now everything is set up, lets start the game!"
    puts "-----------------------------------------------------\n\n"
    puts "Player #{@current_player.name} starts...\n\n"
  end

  #main method to make a move, if the user is a human, then it will prompt the user for their move
  def make_move
    
  end
  
  #switches the players turn
  def change_turns 
    
  end
  
  #method to check if a given input move is legal or illegal
  def move_is_valid(input)
    return true if ((input >= 1) && (input <= 9)) && @gb.is_empty?(input)
    return false
  end
  
  #method returns true or false if game is over
  def is_over
    result = false
    
    # game is over if there's a winning move or there have been 9 game moves
    if gb.winning_move?
      result = true
      # do something with win message
    elsif @total_moves == 9
      result = true
      # @win_message = "Draw game!"
    end
    
    return result
  end
end