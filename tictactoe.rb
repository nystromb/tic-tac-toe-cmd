class TicTacToeGame
  @game_over = false
  
  def initialize
    puts "Welcome to Tic Tac Toe!\n"

    set_game_settings()
    puts "Great! Now everything is set up, lets start the game!"
    puts "-----------------------------------------------------"
    print_instructions()
    
    #create the gameboard and set them to the cell number
    #to help the user know which cell location to choose
    @game_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_moves = 0

  end
  
  def print_instructions
    # instructions to be printed before the game starts
    puts "INSTRUCTIONS:"
  
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
	puts "Press 2 to have Player2 start."
	puts ""
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
    #game can be over if all spots are filled
    if @game_moves == 9
      @game_over = true
    end
    
    #or if a player has a winning move (three x's or o's in a row)
    
    
    @game_over
  end
  
  def print_game_board
    puts "-----------------------------------------------------"
    if @game_over != true
      print "\n#{@current_player}'s turn...\n\n"
    else
      print "\nFINAL\n\n"
    end
    count = 1
    @game_board.each do |cell|
      print String(cell) + " "
      print "\n" if (count == 3) || (count == 6) || (count == 9) 
      count += 1
    end
  end
  
  def change_turn
    if @current_player.downcase == @player_one.downcase
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end
  
  def move_is_valid(input)
    result = false #assume false until proven otherwise
    
    #check to see if other player already took that spot
    if @game_board[input-1] == input
      result = true 
    elsif input == 0
      puts "Invalid input, try again"
    else 
      puts "Somebody took this position, try another spot"
    end
    
    result
  end
  
  def get_move
    #print current game board for user
    print_game_board()
  
    print "\n#@current_player, where would you like to make your move? (Choose 1 -> 9)\n"
    loop do
      print "> "
      @user_move = Integer(gets.chomp)
      break if move_is_valid(@user_move)
    end
    #the move is valid now, so put the move on the board
    play_move(@user_move)
  end
  
  def play_move(input)
    if @current_player.downcase == @player_one.downcase
      @game_board[input-1] = "X"
    else
      @game_board[input-1] = "O"
    end
    @game_moves += 1
    change_turn()
  end
  
end #end TicTacToeGame class

#create a new game class to start
game = TicTacToeGame.new

#loop through until the game over status is true
until game.is_over()
  game.get_move()
end

#print final game board
game.print_game_board()

#once we broke through the previous loop, the game should be over.
puts "\nGame Over!"

