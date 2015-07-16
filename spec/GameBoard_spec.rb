require "gameboard"

RSpec.describe GameBoard do
  describe '# Initial game board:' do
    it 'All game board locations should be empty (nil)' do
      9.times { |i|  expect(GameBoard.new.is_empty?(i+1)).to eq(true) }
    end
    it 'Should have no winning move' do
      expect(GameBoard.new.winning_move?).to eq(false)
    end
  end
  
  describe '# Playing game moves' do
    board = GameBoard.new
    it 'place a game piece at location 1' do
      board.play_move(1, "X")
      expect(board.get_piece_at(1)).to eq("X")
    end
    it 'Confirm if the indexes are empty' do
      board = GameBoard.new
      
      expect(board.is_empty?(1)).to eq(true)
      board.play_move(1, "X")
      expect(board.is_empty?(1)).to eq(false)
      
      expect(board.is_empty?(9)).to eq(true)
      board.play_move(9, "O")
      expect(board.is_empty?(9)).to eq(false)
    end
  end
  
  describe 'winning_move? function' do
    it 'Should detect if there is a winning OOO move' do
      board = GameBoard.new
      board.play_move(2, "O")
      board.play_move(5, "O")
      board.play_move(8, "O")
      expect(board.winning_move?).to eq(true)
    end
    it 'Should detect a winning XXX move' do
      board = GameBoard.new
      board.play_move(1, "X")
      board.play_move(5, "X")
      board.play_move(9, "X")
      board.to_s
      expect(board.winning_move?).to eq(true)
    end
  end
end