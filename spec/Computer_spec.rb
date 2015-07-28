require 'players'
require 'gamemodel'
require 'tictactoegame'

RSpec.describe Computer do
  describe 'generate move' do
    it 'X at 2, 6, 9 : O at 8, 9' do
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
      move = computer.generate_move(model)
      expect(move).to eq(3)
    end
    it 'X at 1, 6, 9 : O at 8, 9' do
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
      move = computer.generate_move(model)
      
      expect(move).to eq(5)
    end
    it 'other player 1 til win at 1 and 5' do
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
      move = computer.generate_move(model)
      
      expect(move).to eq(9)
    end
    it 'Second move in middle at 5 if goes in corner' do
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
      move = computer.generate_move(model)
      expect(move).to eq(5)
    end
    it 'Second move in middle at 5 if goes in corner' do
      model = GameModel.new
      
      p1 = Player.new
      p2 = Computer.new
      p1.starts = true
      p1.peice = "X"
      p2.peice = "O"
      model.set_players(p1, p2)
      
      
      model.play(3)
      
      model.to_s
      
      computer = Computer.new
      move = computer.generate_move(model)
      expect(move).to eq(5)
    end
    it 'first move is in middle, computer goes in corner' do
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
      move = computer.generate_move(model)
      expect(move).to eq(1)
    end
    it 'check corner move on blank board' do
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
      move = computer.generate_move(model)
      
      expect(move).to eq(1)
    end
    it 'bug found when playing this board could have lost' do
      model = GameModel.new
      
      p1 = Player.new
      p2 = Computer.new
      p1.starts = true
      p1.peice = "X"
      p2.peice = "O"
      model.set_players(p1, p2)
      
      
      model.play(1)
      model.play(5)
      model.play(6)
      model.play(4)
      model.play(8)
      
      model.to_s
      
      computer = Computer.new
      computer.starts = true
      move = computer.generate_move(model)
      expect(move).to eq(3)
    end
  end
end