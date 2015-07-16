require "gameboard"

RSpec.describe GameBoard do
  describe '# initialize:' do
    it 'should be have all game board locations empty' do
      9.times { |i|  expect(GameBoard.new.is_empty?(i+1)).to eq(true) }
    end
    it 'should have no winning move' do
      expect(GameBoard.new.winning_move?).to eq(false)
    end
  end
  
  describe '# play_move and get_peice_at:' do
    board = GameBoard.new
    it 'can place a game piece at location' do
      board.play_move(1, "X")
      expect(board.get_piece_at(1)).to eq("X")
    end
    it 'confirm if the indexes are empty' do
      board = GameBoard.new
      
      expect(board.is_empty?(1)).to eq(true)
      board.play_move(1, "X")
      expect(board.is_empty?(1)).to eq(false)
      
      expect(board.is_empty?(9)).to eq(true)
      board.play_move(9, "O")
      expect(board.is_empty?(9)).to eq(false)
    end
    it 'fill all spots and check is empty' do
      board = GameBoard.new
      9.times {|i| expect(board.is_empty?(i+1)).to eq(true)}
      9.times {|i| expect(board.is_empty?(i+10)).to eq(false)}
      9.times { |i| board.play_move(i+1,"X") }
      9.times { |i| expect(board.is_empty?(i+1)).to eq(false)}
      
    end
  end
  
  describe 'winning_move? function' do
    it 'should detect if there is a winning OOO move' do
      board = GameBoard.new
      board.play_move(2, "O")
      board.play_move(5, "O")
      board.play_move(8, "O")
      expect(board.winning_move?).to eq(true)
    end
    it 'should detect a winning XXX move' do
      board = GameBoard.new
      board.play_move(1, "X")
      board.play_move(5, "X")
      board.play_move(9, "X")
      expect(board.winning_move?).to eq(true)
    end
  end
end