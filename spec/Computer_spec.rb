require 'Players'
require 'gamemodel'

RSpec.describe GameModel do
  describe 'generate move' do
    it 'test run on a blank board' do
      game = GameModel.new
      game.init_players(1, 1)
      comp = Computer.new
      outcomes = comp.generate_move(game.clone)
    end
    it 'test run on a board with 5 played moves' do
      game = GameModel.new
      game.init_players(1,1)
      comp = Computer.new
      game.play(2)
      game.play(8)
      game.play(6)
      game.play(7)
      game.play(9)
      game.to_s
      outcomes = comp.generate_move(game.clone)
    end
  end
end