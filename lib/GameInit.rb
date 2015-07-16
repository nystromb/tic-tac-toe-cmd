class GameInit
  attr_accessor :ready
  attr_accessor :first_player
  attr_accessor :game_mode
  attr_accessor :mode_to_s
  
  def initialize(mode = 2, first_player = 1)
    @ready = false
    @game_mode = mode
    @first_player = first_player
  end
  
  def players
    if (@game_mode == 1)
      @mode_to_s = "Human v. Computer"
      @player1 = Human.new
      @player2 = Computer.new
    elsif (@game_mode == 2)
      @mode_to_s = "Human v. Human"
      @player1 = Human.new
      @player2 = Human.new
    elsif (@game_mode == 3)
      @mode_to_s = "Computer v. Computer"
      @player1 = Computer.new
      @player2 = Computer.new
    end
    
    if (@first_player == 1)
      @player1.starts = true
      @player1.peice = "X"
      @player2.peice = "O"
    else
      @player2.starts = true
      @player2.peice = "O"
      @player1.peice = "X"
    end
    
    return @player1, @player2
  end

  def check_args(mode, first_player)
    if (first_player.to_i == 1) || (first_player.to_i == 2)
      @first_player = first_player
      case (mode.to_i)
      when 1..3
        return true
      else
        return false
      end
    end
  end

end