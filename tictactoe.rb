class TicTacToeGame

  def initialize
    puts "Welcome to Tic Tac Toe!"
    puts ""

    get_game_settings
    puts "Great! Now everything is set up, lets start the game!"
    puts "-----------------------------------------------------"
  end
  
  def get_game_settings
  
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
        print "Please enter a valid game type (Press 1 for 1 Player, 2 for 2 Players, 3 for an automated game)"
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

end

game = TicTacToeGame.new

