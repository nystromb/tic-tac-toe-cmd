require "gameboard"

RSpec.describe GameBoard do
  describe '# New Game:' do
    it 'All game board locations should be empty (nil)' do
      9.times { |i|  expect(GameBoard.new.is_empty?(i)).to eq(true) }
    end
    it 'Play some locations and check for not empty' do
      board = GameBoard.new
      
      expect(board.is_empty?(1)).to eq(true)
      board.play_move(1, "X")
      expect(board.is_empty?(1)).to eq(false)
      
      expect(board.is_empty?(9)).to eq(true)
      board.play_move(9, "O")
      expect(board.is_empty?(9)).to eq(false)
    end
  end
  
  describe '# Playing game moves' do
    board = GameBoard.new
    it 'Place an X at location 1' do
      board.play_move(1, "X")
      expect(board.get_piece_at(1)).to eq("X")
    end
  end
end