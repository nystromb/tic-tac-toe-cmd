require "gamemodel"
require "gameboard"
require "players"

RSpec.describe GameModel do
  describe '# valid moves ' do
    it 'Should only accept a move that is 1..9' do
      gb = GameModel.new(1,1)
      #1..9 should be true
      9.times { |i| expect(gb.move_is_valid(i+1)).to eq(true)}
      
      #10..19 should be false
      9.times { |i| expect(gb.move_is_valid(i+10)).to eq(false)}
      
      #less than 1 shouldn't work either
      9.times { |i| expect(gb.move_is_valid(i-8)).to eq(false)}
      
      #if user inputs a string..
      expect(gb.move_is_valid("string").to eq(false))
    end
  end
  
  
end
