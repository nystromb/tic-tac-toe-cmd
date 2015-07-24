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
    @outcome = {1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0, 6 => 0, 7 => 0, 8 => 0, 9 => 0,}
  end
  
  def is_human? 
    return false
  end
  
  def generate_move(game, outcomes = {}, depth = 0)
    return score(game, depth) if game.is_over?
    
    moves = game.get_empty_locs
    
    moves.each do |move|
      game.play(move)
      node = game.clone
      node.to_s
      outcomes[move] = generate_move(node, outcomes, depth + 1)
      game.play(move, nil)
    end
    
    print "DEPTH: #{depth}\nOUTCOMES: #{outcomes} \n"
    if (game.current_player.peice == "X")
      #get the max number
      game.to_s
      print "MAX\n"
      best_score = -100
      best_move = nil
      outcomes.each do |move, score|
        if(score.is_a? Integer)
          if score > best_score
            best_score = score
            best_move = move
          end
        end
      end
    elsif (game.current_player.peice == "O") 
      #get the min number
      game.to_s
      print "MIN\n"
      best_score = 100
      best_move = nil
      print "OUTCOMES: #{outcomes} \n"
      outcomes.each do |move, score|
        if(score.is_a? Integer)
          if score < best_score
            best_score = score
            best_move = move
          end
        end
      end
      
      print "SCORE: #{best_score}, BEST_MOVE: #{best_move}"
      return best_move
    end
  end
  
  def score(game, depth)
    puts "GAME WINNER: #{game.winner}"
    case game.winner
    when "X"
      return 10 - depth
    when "O"
      return depth - 10
    when nil
      return 0
    end
  end
end