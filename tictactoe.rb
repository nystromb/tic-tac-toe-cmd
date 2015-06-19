class TicTacToeGame
  @game_over = false
  
  def initialize
    puts "Welcome to Tic Tac Toe!"
    puts ""
    puts @game_board

    set_game_settings
    puts "Great! Now everything is set up, lets start the game!"
    puts "-----------------------------------------------------"
    
    #create the gameboard and set them to E which refers to empty
    @game_board = [["E", "E", "E"],["E", "E", "E"],["E", "E", "E"]]
    game_over = true;
  end
  
  def set_game_settings
  
    #Helpful instructions for first time user:
    puts "Here are your options:"
    puts "Press 1 for 1 Player mode. "
    puts "Press 2 for 2 Player mode. "
    puts "Press 3 for an automated game."

    puts ""

    #Get user input for the game mode:
    print "What do you want your game mode to be? "

    while true
      @game_mode = Integer(gets.chomp)
  
      if @game_mode == 1
        puts "You selected 1 Player mode."
        break
      elsif @game_mode == 2
        puts "You selected 2 Player mode"
        break
      elsif @game_mode == 3
        puts "You selected an automated mode."
        break
      else
        print "Please enter a valid game type: "
      end
    end
    puts ""

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
        puts ""
        puts "The starting player is Player#@starting_player"
        break
      end
    end

    puts ""
  end
  
  def get_game_status
    @game_over
  end
  
  #print out the game board
  def print_game_board 
    @game_board.each do |cell|
      cell.each { |c| print c + " " }
      print "\n"
    end
  end


end

#create a new game class to start
game = TicTacToeGame.new

game.print_game_board()

#loop through until the game over status is true
until game.get_game_status() 
  
end

puts "Game Over!"

