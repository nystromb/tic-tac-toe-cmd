class TicTacToeGame  
  def initialize
    puts "Welcome to Tic Tac Toe!\n"
    set_game_settings()
    #create the gameboard and set them to the cell number
    #to help the user know which cell location to choose
    @win_message
    @game_moves = {:x_win_move => nil, :o_win_move => nil, :last_move => nil, :total_moves => 0}
  end
  
  #prompts user for game settings before game starts
  def set_game_settings
    #Helpful instructions for first time user:
    puts "\nHere are your options:"
    puts "Press 1 for 1 Player mode. "
    puts "Press 2 for 2 Player mode. "
    puts "Press 3 for an automated game.\n\n"

    #Get user input for the game mode:
    print "What do you want your game mode to be? "

    while true
      @game_mode = Integer(gets.chomp)
  
      if @game_mode == 1
        puts "You selected 1 Player mode.\n\n"
        break
      elsif @game_mode == 2
        puts "You selected 2 Player mode.\n\n"
        break
      elsif @game_mode == 3
        puts "You selected an automated mode.\n\n"
        break
      else
        print "Please enter a valid game type: "
      end
    end

	# Helpful instructions for options
	puts "Here are some more options:"
	puts "Press 1 to have Player1 start."
	puts "Press 2 to have Player2 start.\n\n"
    # Get user input for whoever is going to have the first turn:
    print "Now, select who gets to go first: "
    while true
      @starting_player = Integer(gets.chomp)
      unless (@starting_player == 1) || (@starting_player == 2)
        print "Invalid input, try again: "   
      else
        puts "The starting player is Player#@starting_player\n\n"
        break
      end
    end
    
    set_players()

    puts "Great! Now everything is set up, lets start the game!"
    puts "-----------------------------------------------------"
  end
  
  #sets players names based on game mode selected (Human vs. Computer or Player1 vs. Player2 or Computer1 vs. Computer2)
  def set_players
	@player_one
	@player_two
	#set names for player one and player two
    case @game_mode
    when 1
      @player_one = "Human"
      @player_two = "Computer"
    when 2
      @player_one = "Player1"
      @player_two = "Player2"
    when 3
      @player_one = "Computer1"
      @player_two = "Computer2"
    end
    
    #set the current players turn
    if @starting_player == 1
      @current_player = @player_one
    else
      @current_player = @player_two
    end
  end
  
  #method returns true or false if game is over
  #checked after every move
  def is_over    
    game_over = false
    
    # game is over if there's a winning move or there have been 9 game moves
    if winning_move()
      game_over = true
    elsif @game_moves[:total_moves] == 9
      game_over = true
      @win_message = "Draw game!"
    end
    
    if game_over
      puts "\nGAME OVER!\n\n"
      #print final game board
      print_game_board()
      puts "\n#@win_message\n\n"
    else # next players turn
      print "\n#{@current_player}'s turn...\n\n"
    end
    
    game_over
  end
  
  #changes the players turn after every move
  def change_turn
    if @current_player.downcase == @player_one.downcase
      @current_player = @player_two
    else
      @current_player = @player_one
    end
    
    puts "-----------------------------------------------------"
  end
  
  #method to check whether the current player is a computer or not
  #returns true or false
  def current_player_is_computer
    result = false
    if (@current_player == "Computer") || (@current_player == "Computer1") || (@current_player == "Computer2")
      result = true
    end
    result
  end
  
  #method to check if a given move is legal or illegal
  #prompts user if there is a problem
  def move_is_valid(input)
    result = false #assume false until proven otherwise
    
    #check to see if other player already took that spot
    if (@game_board[input-1] == input)
      result = true 
    elsif (input < 1) || (input > 9)
      puts "Invalid input, try again"
    else
      if !current_player_is_computer
        puts "That spot is taken already. Try again"
      end
    end
    result
  end
  
  #method to check if there is a winning move the computer can play
  #returns true or false
  def computer_can_win
    result = false
    if (@current_player == @starting_player)
      #check for x win move
      if (@game_moves[:x_win_move] != nil)
        result = true
      end
    else
      #check for o win move
      if (@game_moves[:o_win_move] != nil)
        result = true
      end
    end
    return result
  end
  
  #method to check if the other player has a winning move, used for the computer AI
  def other_can_win
    result = false
    if (@current_player == @starting_player)
      #check for x win move
      if (@game_moves[:o_win_move] != nil)
        result = true
      end
    else
      #check for o win move
      if (@game_moves[:x_win_move] != nil)
        result = true
      end
    end
    return result
  end
  
  #method for computer AI to determine which move to play based on a simple strategy
  def make_computer_move
    @computer_move = 5
    if computer_can_win
      #find out which space to go in
      if(@current_player == @starting_player)
        @computer_move = @game_moves[:x_win_move]
      else
        @computer_move = @game_moves[:o_win_move]
      end
    elsif other_can_win #stop them
      if(@current_player == @starting_player)
        @computer_move = @game_moves[:o_win_move]
        @game_moves[:o_win_move] = nil
      else
        @computer_move = @game_moves[:x_win_move]
        @game_moves[:x_win_move] = nil
      end
    end
    until move_is_valid(@computer_move)
      @computer_move = Random.rand(1..9)
    end
    puts "Computer chose #@computer_move"
    play_move(@computer_move)
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
  
end #end TicTacToeGame class

#create a new game class to start
game = TicTacToeGame.new

#loop through until the game over status is true
until game.is_over()
  game.make_move()
end



