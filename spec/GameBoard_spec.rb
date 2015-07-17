require "gameboard"

RSpec.describe GameBoard do
  describe '# initialize:' do
    it 'should be have all game board locations empty' do
      9.times { |i|  expect(GameBoard.new.get(i+1).nil?).to eq(true) }
    end
  end
  
  describe '# place and get moves:' do
    board = GameBoard.new
    it 'can place a game piece at location' do
      board.place(1, "X")
      expect(board.get(1)).to eq("X")
      
      board.place(2, "0")
      expect(board.get(2)).to eq("0")
    end
  end
  
  describe "# match combination with peice" do 
    board = GameBoard.new
    it 'should detect a winning line up' do
      board.place(1, "X")
      board.place(5, "X")
      board.place(9, "X")
      
      expect(board.match([1,5,9],"X")).to eq(true)
      
      board.place(1, nil)
      board.place(5, nil)
      board.place(9, nil)
      
      expect(board.match([1,5,9],"X")).to eq(false)

    end
    
  end
end