require "gameboard"
RSpec.describe GameBoard do
  describe '#add' do
    it 'returns the sum of its arguments' do
      expect(GameBoard.new.add(1, 2)).to eq(3)
    end
  end
end