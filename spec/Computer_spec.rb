require 'players'
require 'gamemodel'
require 'tictactoegame'

RSpec.describe Computer do
  describe 'generate move outcome' do
    it 'check for correct outcomes' do
      model = GameModel.new
      
      p1 = Player.new
      p2 = Computer.new
      p2.starts = true
      p2.peice = "X"
      p1.peice = "O"
      model.set_players(p1, p2)
      
      
      model.play(2)
      model.play(7)
      model.play(9)
      model.play(8)
      model.play(6)
      
      model.to_s
      
      computer = Computer.new
      computer.starts = true
      c = computer.generate_move(model)
      print c[5]
    end
    it 'check for correct outcomes' do
      model = GameModel.new
      
      p1 = Player.new
      p2 = Computer.new
      p2.starts = true
      p2.peice = "X"
      p1.peice = "O"
      model.set_players(p1, p2)
      
      
      model.play(1)
      model.play(7)
      model.play(9)
      model.play(8)
      model.play(6)
      
      model.to_s
      
      computer = Computer.new
      computer.generate_move(model)
      
    end
    it 'check for correct outcomes' do
      model = GameModel.new
      
      p1 = Player.new
      p2 = Computer.new
      p2.starts = true
      p2.peice = "X"
      p1.peice = "O"
      model.set_players(p1, p2)
      
      
      model.play(1)
      model.play(4)
      model.play(5)
      
      model.to_s
      
      computer = Computer.new
      computer.generate_move(model)
      
    end
    it 'check for correct outcomes top right corner' do
      model = GameModel.new
      
      p1 = Player.new
      p2 = Computer.new
      p1.starts = true
      p1.peice = "X"
      p2.peice = "O"
      model.set_players(p1, p2)
      
      
      model.play(1)
      
      model.to_s
      
      computer = Computer.new
      computer.generate_move(model)
      
    end
    it 'check for correct outcomes on board with center placed' do
      model = GameModel.new
      
      p1 = Player.new
      p2 = Computer.new
      p1.starts = true
      p1.peice = "X"
      p2.peice = "O"
      model.set_players(p1, p2)
      
      
      model.play(5)
      
      model.to_s
      
      computer = Computer.new
      computer.generate_move(model)
      
    end
    it 'check for correct outcomes on blank board' do
      model = GameModel.new
      
      p1 = Computer.new
      p2 = Player.new
      p1.starts = true
      p1.peice = "X"
      p2.peice = "O"
      model.set_players(p1, p2)
      
      model.to_s
      
      computer = Computer.new
      computer.starts = true
      computer.generate_move(model)
      
    end
  end
end