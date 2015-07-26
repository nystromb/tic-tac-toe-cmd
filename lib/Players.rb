class Player
  attr_accessor :name
  attr_accessor :starts
  attr_accessor :peice
  
  def initialize (name = "Player")
    @starts = false
    @name = name
  end
  
  #player by default is human
  def is_human?
    return true
  end
end

class Computer < Player
  def initialize(name = "Computer")
    @name = name
    @starts = false
  end
  
  def is_human? 
    return false
  end
  
end