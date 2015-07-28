class Computer < Player
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
      outcomes[move] = generate_move(new_node, {}, depth + 1)
      node.play(move, nil)
    end
    
    move = nil
    if(node.current_player.peice == "X")
      best = 100
      outcomes.each { |m, score| best, move = score, m if (score < best) }
    else
      best = -100
      outcomes.each { |m, score| best, move = score, m if (score > best) }
    end
    
    #print "OUTCOMES #{outcomes}, CHOICE: #{move}\n" if depth == 0
    (depth == 0) ? (return move) : (return best)    
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