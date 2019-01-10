require 'cell'

RSpec.describe 'Cell' do
  context 'a context' do
    it 'Cell has a alive boolean attribute' do
      cell = Cell.new(false)
      expect(cell.alive?).to eq true
    end
  end
end
