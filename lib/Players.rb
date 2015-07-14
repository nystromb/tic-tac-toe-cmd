class Human
  attr_accessor :name
  attr_accessor :started
  attr_accessor :game_peice
  
  def initialize (name = "Human")
    @started = false
    @name = name
  end
end

class Computer < Human
  def initialize(name = "Computer")
    @name = name
    @started = false
  end
end