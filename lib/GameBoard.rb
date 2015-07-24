class GameBoard
  attr_reader :spots
  attr_reader :corners
  attr_reader :cross
  
  def initialize
    @spots = {1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil, 8 => nil, 9 => nil}
  end
  
  #method to play a given move, and puts it on the game_board
  def place(location, piece)
    @spots[location] = piece
  end
  
  #get the piece at the specified game board location
  def get(location)
    return @spots[location]
  end
  
  #returns true if the spot index combo matches the given peice
  def match(combo, piece)
   return true if (@spots[combo[0]] == piece) && (@spots[combo[1]] == piece) && (@spots[combo[2]] == piece)
   return false
  end
  
  #returns true if the given location is a winning next move
  def next_win?(combo, location, piece)
    combo.each do |i|
      #if index is in combo array
      if (location == i[0]) || (location == i[1]) || (location == i[2])
        #check for 1 empty and 2 filled with the peice (ex XXE, XEX, EXX)
        if ((@spots[i[0]] == piece) && (@spots[i[1]] == piece) && (@spots[i[2]].nil?))
          return true
        elsif ((@spots[i[0]] == piece) && (@spots[i[1]].nil?) && (@spots[i[2]] == piece))
          return true
        elsif ((@spots[i[0]].nil?) && (@spots[i[1]] == piece) && (@spots[i[2]] == piece))
          return true
        end
      end
    end
    return false
  end
end