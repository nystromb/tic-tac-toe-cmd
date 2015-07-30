require 'player'
require 'gamemodel'
require 'gameboard'

RSpec.describe GameModel do
  describe 'minimax algorithm' do
    it 'computer is p2: should make the move at 3 on this board' do
      board = GameBoard.new
      model = GameModel.new(2, 1)
      
      board.play(2, "X")
      board.play(7, "O")
      board.play(9, "X")
      board.play(8, "O")
      board.play(6, "X")

      board.current_player = model.p2
      
      move = model.generate_move(board)
      expect(move).to eq(3)
    end
    it 'computer is p1: should make the move at 1' do
      board = GameBoard.new
      model = GameModel.new(2, 1)
      
      board.current_player = model.p1
      
      move = model.generate_move(board)
      expect(move).to eq(1)
    end
    it 'computer is p2: should make the move at 1' do
      board = GameBoard.new
      model = GameModel.new(2, 1)
      board.current_player = model.p2
    
      board.play(5, "X")
      
      move = model.generate_move(board)
      expect(move).to eq(1)
    end
    it 'computer is p2: should make the move at 9' do
      board = GameBoard.new
      model = GameModel.new(2, 1)
      
      board.play(1, "X")
      board.play(4, "O")
      board.play(5, "X")
      
      board.current_player = model.p2
      
      move = model.generate_move(board)
      expect(move).to eq(9)
    end
  end
end