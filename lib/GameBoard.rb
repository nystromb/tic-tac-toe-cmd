class GameBoard
  
  def initialize
    @board = {1 => nil,2 => nil,3 => nil,4 => nil,5 => nil,6 => nil,7 => nil,8 => nil,9 => nil}
    @win_combination = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  end
  
  #method to play a given move, and puts it on the game_board
  def play_move(index, piece)
    @board[index] = piece
  end
  
  #get the piece at the specified game board location
  def get_piece_at(index)
    return @board[index]
  end
  
  #check if the game location is empty
  def is_empty?(index)
    return true if (index > 0 && index <= 9) && (@board[index].nil?)
    return false
  end
  
  #checks game board for a winning combination exists
  def winning_move?
    @win_combination.each do |index|
      #check game board to see if XXX or OOO combination exists
      if (@board[index[0]] == "X") && (@board[index[1]] == "X") && (@board[index[2]] == "X")
        return true
      elsif (@board[index[0]] == "O") && (@board[index[1]] == "O") && (@board[index[2]] == "O")
        return true
      end
    end
    return false
  end
  
  #method prints out the current game board
  def to_s
    @board.each do |index, value|
      if value.nil?
        print " #{index} "
      else
        print " #{value} "
      end
      print "\n" if (index % 3) == 0 
    end
    print "\n"
  end
  
end