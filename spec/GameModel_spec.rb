require "gamemodel"
require "gameprompt"
require "players"

RSpec.describe GameModel do
  describe '# move_is_valid: ' do
    model = GameModel.new
    it 'should only accept a move that is 1..9' do
      #1..9 should be true
      9.times { |i| expect(model.move_is_valid(i+1)).to eq(true)}
      
      #10..19 should be false
      9.times { |i| expect(model.move_is_valid(i+10)).to eq(false)}
      
      #less than 1 shouldn't work either
      9.times { |i| expect(model.move_is_valid(i-8)).to eq(false)}
    end
    it 'can accept a nil value' do
      expect(GameModel.new.move_is_valid(nil)).to eq(false)
    end
  end
  describe '# winning_move?:' do
    it 'should have no winning move upon initialization' do
      expect(GameModel.new.winning_move?).to eq(false)
    end
    it 'should detect if there is a winning OOO move' do
      model = GameModel.new
      model.play(2, "O")
      model.play(5, "O")
      model.play(8, "O")
      expect(model.winning_move?).to eq(true)
    end
    it 'should detect a winning XXX move' do
      model = GameModel.new
      model.play(1, "X")
      model.play(5, "X")
      model.play(9, "X")
      expect(model.winning_move?).to eq(true)
    end
  end
  describe '#empty locs' do
    it 'test empty locations' do
      model = GameModel.new
      
      expect(model.get_empty_locs).to eq([1,2,3,4,5,6,7,8,9])
      
      model.play(5)
      model.play(9)
      model.play(1)
      
      expect(model.get_empty_locs).to eq([2,3,4,6,7,8])
    end
  end
  
  describe '#next_win? :' do
    it 'XXE' do
      board = GameBoard.new
      combo = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
      
      expect(board.next_win?(combo, 1, "X")).to eq(false)
      
      board.place(1, "X")
      board.place(5, "X")
      
      expect(board.next_win?(combo ,9 , "X")).to eq(true)
      
      board.place(1, "O")
      board.place(5, "O")
      
      expect(board.next_win?(combo ,9 , "O")).to eq(true)
    end
    it 'XEX' do
      board = GameBoard.new
      combo = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
      
      board.place(1, "O")
      board.place(3, "O")
      
      expect(board.next_win?(combo, 1, "O")).to eq(true)
    end
    it 'EXX' do
      board = GameBoard.new
      combo = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
      
      board.place(8, "X")
      board.place(9, "X")
      
      expect(board.next_win?(combo, 7, "X")).to eq(true)
    end
  end
end
