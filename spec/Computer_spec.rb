require 'players'

RSpec.describe Computer do
  describe 'default Computer attributes' do
    it 'name is Computer by default' do
      expect(Computer.new.name).to eq("Computer")
    end
    it 'start is false by default' do
      expect(Computer.new.started).to eq(false)
    end
    it 'should be able to set the game peices for the person' do
      c = Computer.new
      c.game_peice = "X"
      expect(c.game_peice).to eq("X")
    end
  end
end