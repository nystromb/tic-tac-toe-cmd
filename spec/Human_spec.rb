require 'players'

RSpec.describe Human do
  describe 'default human attributes' do
    it 'name is Human by default' do
      expect(Human.new.name).to eq("Human")
    end
    it 'start position is false by default' do
      expect(Human.new.started).to eq(false)
    end
    it 'can be set to first player' do
      p = Human.new
      p.started = true
      expect(p.started).to eq(true)
    end
  end
    
end