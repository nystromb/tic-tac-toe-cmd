class TicTacToeGame  
  def initialize
    puts "Welcome to Tic Tac Toe!\n"

    set_game_settings()
    print_instructions()
    
    #create the gameboard and set them to the cell number
    #to help the user know which cell location to choose
    @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_moves = 0
    @winning_lines =[[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @win_message
  end
  
  def winning_move
    result = false
    @winning_lines.each do |lines|
      if(@game_board[lines[0]-1] == "X") && (@game_board[lines[1]-1] == "X") && (@game_board[lines[2]-1] == "X")
        result = true
        @win_message = "#@player_one wins!" 
      elsif (@game_board[lines[0]-1] == "O") && (@game_board[lines[1]-1] == "O") && (@game_board[lines[2]-1] == "O")
        result = true
        @win_message = "#@player_two wins!"  
      end
    end
    result
  end
  
  def print_instructions
    # instructions to be printed before the game starts
    puts "INSTRUCTIONS:\n\n"
    
    puts "-----------------------------------------------------"
  end
  
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
  
  def is_over    
    game_over = false
    
    # game is over if there's a winning move or there have been 9 game moves
    if winning_move()
      game_over = true
    elsif @game_moves == 9
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

  def print_game_board
    count = 1
    @game_board.each do |cell|
      print String(cell) + " "
      print "\n" if (count % 3) == 0 
      count += 1
    end
  end
  
  def change_turn
    if @current_player.downcase == @player_one.downcase
      @current_player = @player_two
    else
      @current_player = @player_one
    end
    
    puts "-----------------------------------------------------"
  end
  
  def current_player_is_computer
    result = false
    if (@current_player == "Computer") || (@current_player == "Computer1") || (@current_player == "Computer2")
      result = true
    end
    result
  end
  
  def make_computer_move
    @computer_move = 5
    
    until move_is_valid(@computer_move)
      #make strategic moves 
      @computer_move = Random.rand(1..9)
    end
    
    puts "Computer played #@computer_move"
    play_move(@computer_move)
  end
  
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
    change_turn()
  end
  
  def center_taken
    result = false
    if (@game_board[4] != "X") || (@game_board[4] != "O")
      result = true
    end
    result
  end

  def move_is_valid(input)
    result = false #assume false until proven otherwise
    
    #check to see if other player already took that spot
    if @game_board[input-1] == input
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
  
  def play_move(input)
    if @current_player.downcase == @player_one.downcase
      @game_board[input-1] = "X"
    else
      @game_board[input-1] = "O"
    end
    @game_moves += 1
  end
  
end #end TicTacToeGame class

#create a new game class to start
game = TicTacToeGame.new

#loop through until the game over status is true
until game.is_over()
  game.make_move()
end



