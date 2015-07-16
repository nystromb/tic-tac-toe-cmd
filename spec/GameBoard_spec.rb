require "gameboard"

RSpec.describe GameBoard do
  describe '# New Game:' do
    it 'All game board locations should be empty (nil)' do
      9.times { |i|  expect(GameBoard.new.is_empty?(i+1)).to eq(true) }
    end
    it 'check for empty game board' do
      board = GameBoard.new
      
      expect(board.is_empty?(1)).to eq(true)
      board.play_move(1, "X")
      expect(board.is_empty?(1)).to eq(false)
      
      expect(board.is_empty?(9)).to eq(true)
      board.play_move(9, "O")
      expect(board.is_empty?(9)).to eq(false)
    end
    it 'fresh game board should have a no winning move' do
      expect(GameBoard.new.winning_move?).to eq(nil)
    end
  end
  
  describe '# Playing game moves' do
    board = GameBoard.new
    it 'can place a game piece at location 1' do
      board.play_move(1, "X")
      expect(board.get_piece_at(1)).to eq("X")
    end
    it 'should detect a winning move' do
      board.play_move(2, "O")
      board.play_move(5, "O")
      board.play_move(8, "O")
      expect(board.winning_move?).to eq("O")
    end
  end
end