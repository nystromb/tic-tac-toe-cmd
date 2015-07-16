class Human
  attr_accessor :name
  attr_accessor :starts
  attr_accessor :game_peice
  
  def initialize (name = "Human")
    @starts = false
    @name = name
  end

  def is_human?
    return true
  end
end

class Computer < Human
  def initialize(name = "Computer")
    @name = name
    @starts = false
  end
  
  def is_human? 
    return false
  end
  
end