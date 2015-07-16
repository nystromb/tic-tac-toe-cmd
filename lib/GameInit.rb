class GameInit
  attr_accessor :ready
  attr_accessor :player1
  attr_accessor :player2
  attr_accessor :mode
  
  def initialize(prompt)
    @prompt = prompt
    @player1 = nil
    @player2 = nil
    @ready = false
  end
  
  def players(mode)
    if (mode == 1)
      @mode = "Human v. Computer"
      @player1 = Human.new
      @player2 = Computer.new
    elsif (mode == 2)
      @mode = "Human v. Human"
      @player1 = Human.new
      @player2 = Human.new
    elsif (mode == 3)
      @mode = "Computer v. Computer"
      @player1 = Computer.new
      @player2 = Computer.new
    end
  end
  
  def set_starting(player)
    if (player == 1)
      @player1.starts = true
      @player1.peice = "X"
    else
      @player2.starts = true
      @player2.peice = "O"
    end
  end
  
  def cmd_line_args(mode, fp)
    (((fp.to_i == 1) || (fp.to_i == 2)) && mode_valid(mode.to_i)) ? result = true : result = false
    return result
  end

  def mode_valid(m)
    case m
    when 1
      return true
    when 2
      return true  
    when 3
      return true
    else
      return false
    end
  end

end