class Player
  attr_accessor :name, :starts, :peice, :human
  
  def initialize (name = "Player")
    @starts = false
    @human = true
    @name = name
  end
end
