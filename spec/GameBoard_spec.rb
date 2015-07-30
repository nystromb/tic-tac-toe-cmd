require "gameboard"
require "player"

RSpec.describe GameBoard do
  describe '# move_is_valid: ' do
    board = GameBoard.new
    it 'should only accept a move that is 1..9' do
      #1..9 should be true
      9.times { |i| expect(board.move_is_valid(i+1)).to eq(true)}
      
      #10..19 should be false
      9.times { |i| expect(board.move_is_valid(i+10)).to eq(false)}
      
      #less than 1 shouldn't work either
      9.times { |i| expect(board.move_is_valid(i-8)).to eq(false)}
    end
  end
  describe '# winning_move?:' do
    it 'should have no winning move upon initialization' do
      expect(GameBoard.new.winning_move?).to eq(false)
    end
    it 'should detect if there is a winning OOO move' do
      board = GameBoard.new
      board.play(2, "O")
      board.play(5, "O")
      board.play(8, "O")
      expect(board.winning_move?).to eq(true)
    end
    it 'should detect a winning XXX move' do
      board = GameBoard.new
      board.play(1, "X")
      board.play(5, "X")
      board.play(9, "X")
      expect(board.winning_move?).to eq(true)
    end
  end
  describe 'empty locs' do
    it 'test empty locations' do
      board = GameBoard.new
      
      expect(board.get_empty_locs).to eq([1,2,3,4,5,6,7,8,9])
      
      board.play(5, "X")
      board.play(9, "O")
      board.play(1, "X")
      
      expect(board.get_empty_locs).to eq([2,3,4,6,7,8])
    end
  end
  describe 'new game state' do
    it 'node should have the same players' do
      p1 = Player.new
      board = GameBoard.new
      board.current_player = p1
      new_board = board.clone
      expect(new_board.current_player).to eq(p1)
      
    end
  end
end
