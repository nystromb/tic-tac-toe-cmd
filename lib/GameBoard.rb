class GameBoard
  def initialize
    @game_board = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end
  
  #method to play a given move, and puts it on the game_board
  def play_move(input, piece)
    @game_board[input-1] = piece
  end
  
  #get the piece at the specified game board location
  def get_piece_at(location)
    return @game_board[location-1]
  end
  
  #check if the game location is empty
  def is_empty?(location)
    return true if @game_board[location-1].nil?
    return false
  end
  
  #method prints out the current game board
  def to_s
    count = 1
    @game_board.each do |loc|
      if loc.nil?
        print " #{count} "
      else
        print "#{loc} "
      end
      print "\n" if (count % 3) == 0 
      count += 1
    end
  end
  
end