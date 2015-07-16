class Prompt
  def initialize
  end
  
  #prompts user for their desired game mode
  def for_game_mode
    #Helpful instructions for first time user:
    puts "\nHere are your options:"
    puts "Press 1 for 1 Player mode. "
    puts "Press 2 for 2 Player mode. "
    puts "Press 3 for an automated game.\n\n"

    #Get user input for the game mode:
    print "What do you want your game mode to be? "
  
    while true
      mode = Integer(gets.chomp)
      case mode
      when 1..3
        break
      else
        print "Please enter a valid game type: "
      end
    end
    
    return mode
  end
  
  #prompts user for desired person to start
  def for_starting_player
    # Helpful instructions for options
    puts "\nHere are some more options:"
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
        break
      end
    end
    
    return start
  end
  
  def intro(name, mode)
    puts "\nGreat! Everything is now set up, lets start the game!\n\n"
    puts "-----------------------------------------------------"
    puts "-------------- Welcome to Tic Tac Toe ---------------"
    puts "-----------------------------------------------------"
    puts "Game Mode: #{mode}\n\n"
    puts "-----------------------------------------------------\n\n"
    puts "Player #{name} starts...\n\n"
  end
  
  def user_move(player)
    (player.starts) ? (print "Player 1 (#{player.peice}): ") : (print "Player 2 (#{player.peice}): ")
    print "where would you like to make your move? "
    move = gets.chomp
    return move
  end
  
  def game_over_msg(winner = nil)
    puts "\nGame Over!\n\n"
    if winner.nil?
      puts "Draw Game!"
    else
      (winner.starts) ? (puts "Player 1 (#{winner.peice}) wins!\n\n") : (puts "Player 2 (#{winner.peice}) wins!\n\n")
    end
  end
end