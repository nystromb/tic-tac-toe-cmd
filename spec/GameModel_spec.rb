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
      
      model.play(5, "X")
      model.play(9, "O")
      model.play(1, "X")
      
      expect(model.get_empty_locs).to eq([2,3,4,6,7,8])
    end
  end
  describe 'playing a game' do
    it 'change turns when playing' do
      gm = GameModel.new
      p1 = Player.new
      p2 = Computer.new
      p1.peice = "X"
      p1.starts = true
      p2.peice = "O"
      gm.set_players(p1, p2)
      
      expect(gm.current_player).to eq(p1)
      gm.play(1)
      expect(gm.current_player).to eq(p2)
    end
  end
  describe 'next win' do
    it 'opponent next win detect' do
      gm = GameModel.new
      p1 = Player.new
      p2 = Computer.new
      p1.peice = "X"
      p1.starts = true
      p2.peice = "O"
      gm.set_players(p1, p2)
      
      gm.play(1) #X
      gm.play(3) #O
      gm.play(5) #X
      gm.play(6) #O
      
      expect(gm.next_win?(9, gm.get_opponent)).to eq(true)
      expect(gm.next_win?(9, gm.current_player.peice)).to eq(true)
      
      gm
    end
  end
end
