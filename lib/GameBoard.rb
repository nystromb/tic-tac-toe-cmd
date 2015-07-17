class GameBoard
  attr_reader :spots
  
  def initialize
    @spots = {1 => nil,2 => nil,3 => nil,4 => nil,5 => nil,6 => nil,7 => nil,8 => nil,9 => nil}
  end
  
  #method to play a given move, and puts it on the game_board
  def place(location, piece)
    @spots[location] = piece
  end
  
  #get the piece at the specified game board location
  def get(location)
    return @spots[location]
  end
  
  def match(combo, peice)
   return true if (@spots[combo[0]] == peice) && (@spots[combo[1]] == peice) && (@spots[combo[2]] == peice)
   return false
  end
end