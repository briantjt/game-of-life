require 'cell'

RSpec.describe 'Cell' do
  context 'Cell state' do
    it 'Cell has an alive boolean attribute' do
      cell = Cell.new(false)
      expect(cell.alive).to eq false
    end

    it 'Returns . if dead and 0 if alive for to_s method' do
      cell1 = Cell.new(true)
      cell2 = Cell.new(false)
      expect(cell1.to_s).to eq '0'
      expect(cell2.to_s).to eq '.'
    end
  end
end
