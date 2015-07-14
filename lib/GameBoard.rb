class GameBoard
  attr_accessor :total_moves
  attr_accessor :last_move
  
  def initialize
    @total_moves = 0
    @last_move = nil
    @game_board = {1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil, 8 => nil, 9 => nil}
    @winning_lines =[[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  end
  
  #method prints out the current game board
  def print_game_board
    count = 1
    @game_board.each do |cell|
      print String(cell) + " "
      print "\n" if (count % 3) == 0 
      count += 1
    end
  end
  
  #method to check if there is a winning line combination (XXX or OOO)
  #returns true or false if there is or is not
  def winning_move?
    result = false
    
    @winning_lines.each do |line|
      if(@game_board[line[0]-1] == "X") && (@game_board[line[1]-1] == "X") && (@game_board[line[2]-1] == "X")
        result = true
      elsif (@game_board[line[0]-1] == "O") && (@game_board[line[1]-1] == "O") && (@game_board[line[2]-1] == "O")
        result = true
      end
    end
    
    result
  end
  
  #method to play a given move, and puts it on the game_board
  def play_move(input)
    if @current_player.downcase == @player_one.downcase
      @game_board[input-1] = "X"
    else
      @game_board[input-1] = "O"
    end
    @total_game_moves += 1
    @last_move = input

  end
  
end