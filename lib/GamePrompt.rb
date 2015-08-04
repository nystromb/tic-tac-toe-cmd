class Prompt
  def initialize
  end
  
  #method prints out the current game board
  def to_s(board)
    print "\n"
    board.each do |index, value|
      (value.nil?) ? (print " #{index} ") : (print " #{value} ")
      print "\n" if (index % 3) == 0 
    end
    print "\n"
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
  
  def intro(player, mode)
    puts "\nGreat! Everything is now set up, lets start the game!\n\n"
    puts "-----------------------------------------------------"
    puts "-------------- Welcome to Tic Tac Toe ---------------"
    puts "-----------------------------------------------------"
    puts "Game Mode: #{mode}\n\n"
    puts "-----------------------------------------------------\n\n"
    (player.starts) ? number = 1 : number = 2
    
    print "#{player.name} #{number} starts... \n"
  end
  
  def user_move(player)
    (player.starts) ? (print "#{player.name} 1 (#{player.peice}): ") : (print "#{player.name} 2 (#{player.peice}): ")
    print "where would you like to make your move? "
    move = STDIN.gets.chomp
    return move
  end
  
  def computer_move
    puts "Computer's thinking..."
  end
  
  def game_over_msg(winner = nil)
    puts "\nGame Over!\n\n"
    if winner.nil?
      puts "Draw Game!"
    else
      print "#{winner} wins!\n\n"
    end
  end
  
  def usage
    puts "USAGE: tictactoe.rb [game mode] [starting player]"
    puts "Game Mode: \n 1 = Single Player \n 2 = Two Player \n 3 = Autonomous Mode"
    puts "Starting Player: 1 or 2"
  end
  
  def chosen(player, move)
    (player.starts) ? number = 1 : number = 2 
    puts "#{player.name} #{number} chose #{move}"
  end
  
  def retry?
    puts "Do you want to try again? y/n"
    ans = STDIN.gets.chomp
    case ans.downcase
    when "y", "yes"
      return true
    else
      return false
    end
  end
end
