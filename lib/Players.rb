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

class Computer < Player
  attr_accessor :choice
  def initialize(name = "Computer")
    @name = name
    @starts = false
  end
  
  def is_human? 
    return false
  end
  
  def generate_move(node, outcomes = {}, depth = 0)
    return score(node, depth) if node.is_over?
    
    moves = node.get_empty_locs
    moves.each do |move|
      node.play(move)
      new_node = node.clone
      outcomes[move] = generate_move(new_node, outcomes, depth + 1)
      node.play(move, nil)
    end
    
    
    if depth == 0
      move = nil
      if(node.current_player.peice == "X")
        best = -100
        outcomes.each do |m, score|
          if (score.is_a? Integer) && (score > best)
            move = m
            best = score
          end
        end
      else
        best = 100
        outcomes.each do |m, score|
          if (score.is_a? Integer) && (score < best)
            move = m
            best = score
          end
        end
      end
      return move
    else
      #print "OUTCOMES #{outcomes}\n"
      return outcomes
    end
  end
  
  def score(game, depth)
    if game.winner == "X"
      return depth - 10
    elsif game.winner == "O"
      return 10 - depth
    elsif game.winner.nil?
      return 0
    end
  end
  
end