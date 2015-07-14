require "gameboard"

RSpec.describe GameBoard do
  describe '# New Game:' do
    it 'All game board locations should be empty (nil)' do
      9.times { |i|  expect(GameBoard.new.get_piece_at(i+1)).to eq(nil) }
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