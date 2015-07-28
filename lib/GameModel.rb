class GameModel
  attr_accessor :current_player
  attr_accessor :board
  attr_reader :winner
  attr_reader :mode

  def initialize(board = nil)
    unless board.nil?
      @board = board
    else
      @board = {1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil, 8 => nil, 9 => nil}
    end
    @winner
  end
  
  def set_players(player1, player2)
    @p1, @p2 = player1, player2
    (@p1.starts) ? @current_player = @p1 : @current_player = @p2
  end
  
  #method returns true or false if game is over
  def is_over?
    return true if (winning_move?) || (spots_filled == 9)
    return false
  end
  
  def play(move, peice = @current_player.peice)
    @board[move] = peice
    change_turns
  end
  
  def change_turns
    (@current_player == @p1) ? @current_player = @p2 : @current_player = @p1
  end
  
  #returns all the empty locations on the board.
  def get_empty_locs
    empty = []
    @board.each do |index, spot|
      empty.push(index) if spot.nil?
    end
    return empty
  end
  
  #method to check if a given input move is legal or illegal
  def move_is_valid(index)
    return true if ((index >= 1) && (index <= 9)) && (@board[index].nil?)
    return false 
  end
  
  #method prints out the current game board
  def to_s
    print "\n"
    @board.each do |index, value|
      (value.nil?) ? (print " #{index} ") : (print " #{value} ")
      print "\n" if (index % 3) == 0 
    end
    print "\n"
  end

  #checks game board for a winning combination exists
  def winning_move?
    winning_moves = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    winning_moves.each do |set|
      #check game board to see if XXX or OOO combination exists
      if (@board[set[0]] == "X") && (@board[set[1]] == "X") && (@board[set[2]] == "X")
        @winner = "X"
        return true
      elsif (@board[set[0]] == "O") && (@board[set[1]] == "O") && (@board[set[2]] == "O")
        @winner = "O"
        return true
      end
    end
    return false
  end
  
  def spots_filled
    count = 0
    @board.each do |index, spot|
      (spot.nil?) ? next : count += 1
    end
    return count
  end
  
end