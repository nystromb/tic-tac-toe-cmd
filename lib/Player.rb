class Player
  attr_accessor :name, :starts, :peice
  
  def initialize (name = "Player")
    @starts = false
    @name = name
  end
  
  #player by default is human
  def is_human?
    return true
  end
end
