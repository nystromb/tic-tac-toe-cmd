require "gamemodel"
require "gameinit"
require "gameboard"
require "gameprompt"
require "players"

RSpec.describe GameModel do
  describe '# initalize players' do
    it 'should be able to access players peice' do
      gb = GameModel.new
      expect(gb.player1.peice).to eq("X")
      expect(gb.player2.peice).to eq("O")
    end
  end
  describe '# move_is_valid: ' do
    gb = GameModel.new
    it 'should only accept a move that is 1..9' do
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
    it 'should accept a numbered string as input' do
      expect(gb.move_is_valid("1")).to eq(true)
      expect(gb.move_is_valid("3")).to eq(true)
    end
    it 'should not accept an invalid number string' do
      expect(gb.move_is_valid("0")).to eq(false)
      expect(gb.move_is_valid("10")).to eq(false)
    end
  end
  describe '# change_turns:' do
    it 'should switch from player 1 to player 2 when called' do
      g = GameModel.new
      # player 2 should be current by default
      expect(g.current_player).to eq(g.player1)
      
      g.change_turns
      expect(g.current_player).to eq(g.player2)
      
      g.change_turns
      expect(g.current_player).to eq(g.player1)
    end
  end
  
  
  
end
