require "./lib/Players.rb"
require "./lib/GameBoard.rb"
require "./lib/GameModel.rb"

if __FILE__ == $0
  #check for game settings
  if ARGV == 2
    mode, start = ARGV
    
    mode.to_i!
    start.to_i!
    
    if (mode > 0) && (mode <= 3) && (start > 0) && (start <= 2)
      @game = GameModel.new(mode, start)
    end
  else # prompt for game settings
    #Helpful instructions for first time user:
    puts "\nHere are your options:"
    puts "Press 1 for 1 Player mode. "
    puts "Press 2 for 2 Player mode. "
    puts "Press 3 for an automated game.\n\n"

    #Get user input for the game mode:
    print "What do you want your game mode to be? "

    mode = Integer(gets.chomp)
    
    while true
  
      if mode == 1
        puts "You selected 1 Player mode.\n\n"
        break
      elsif mode == 2
        puts "You selected 2 Player mode.\n\n"
        break
      elsif mode == 3
        puts "You selected an automated mode.\n\n"
        break
      else
        print "Please enter a valid game type: "
        mode = Integer(gets.chomp)
      end
    end
    
    # Helpful instructions for options
	puts "Here are some more options:"
	puts "Press 1 to have Player1 start."
	puts "Press 2 to have Player2 start.\n\n"
    # Get user input for whoever is going to have the first turn:
    print "Now, select who gets to go first: "
    start = Integer(gets.chomp)
    while true
      unless (start == 1) || (start == 2)
        print "Invalid input, try again: "   
        start = Integer(gets.chomp)
      else
        puts "The starting player is Player#@start\n\n"
        break
      end
    end
    
    @game = GameModel.new(mode, start)
  end
  
  #loop through until the game over status is true
  #until game.is_over()
    #game.make_move()
  #end
end