require "gamemodel"
require "gameboard"
require "gameprompt"
require "players"

RSpec.describe GameModel do
  describe '# Check for valid moves ' do
    gb = GameModel.new
    it 'Only accept a move that is 1..9' do
      #1..9 should be true
      9.times { |i| expect(gb.move_is_valid(i+1)).to eq(true)}
      
      #10..19 should be false
      9.times { |i| expect(gb.move_is_valid(i+10)).to eq(false)}
      
      #less than 1 shouldn't work either
      9.times { |i| expect(gb.move_is_valid(i-8)).to eq(false)}
    end
    it 'should not accept a string as input' do
      expect(gb.move_is_valid("string")).to eq(false)
    end
  end
  
  
end
