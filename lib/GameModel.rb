class GameModel
  attr_reader :mode
  attr_reader :current_player
  attr_reader :total_moves
  attr_reader :winner
  
  def initialize(mode = 2, sp = 1)
    @board = GameBoard.new
    init_players(mode, sp)
    @total_moves = 0
    @winning_moves = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    @winner = nil
  end
  
  #method returns true or false if game is over
  def is_over
    return true if (winning_move?) || (@total_moves == 9)
    return false
  end
  
  def play(move)
    @board.place(move, @current_player.peice)
    @total_moves += 1
    change_turns
  end
  
  #method to check if a given input move is legal or illegal
  def move_is_valid(input)
    return true if (input > 0 && input < 10) && (@board.get(input).nil?)
    return false 
  end
  
  def change_turns
    (@current_player == @p1) ? @current_player = @p2 : @current_player = @p1
  end
  
  #method prints out the current game board
  def to_s
    print "\n"
    @board.spots.each do |index, value|
      (value.nil?) ? (print " #{index} ") : (print " #{value} ")
      print "\n" if (index % 3) == 0 
    end
    print "\n"
  end

  #checks game board for a winning combination exists
  def winning_move?
    @winning_moves.each do |set|
      #check game board to see if XXX or OOO combination exists
      if (@board.match(set, @p1.peice))
        @winner = @p1
        return true
      elsif(@board.match(set, @p2.peice))
        @winner = @p2
        return true
      end
    end
    return false
  end
  
  def init_players(mode, sp)
    case mode
    when 1
      @mode = "Human v. Computer"
      @p1 = Human.new
      @p2 = Computer.new
    when 2
      @mode = "Human v. Human"
      @p1 = Human.new
      @p2 = Human.new
    when 3
      @mode = "Computer v. Computer"
      @p1 = Computer.new
      @p2 = Computer.new
    else
      puts "Could not create players"
      exit
    end

    if (sp == 1)
      @p1.starts = true
      @p1.peice = "X"
      @p2.peice = "O"
    else
      @p2.starts = true
      @p2.peice = "O"
      @p1.peice = "X"
    end
    
    (@p1.starts) ? @current_player = @p1 : @current_player = @p2
  end
end