require 'cell'

RSpec.describe 'Cell' do
  context 'Cell state' do
    it 'Cell has a alive boolean attribute and x/y coordinates' do
      cell = Cell.new(false, 4, 5)
      expect(cell.alive).to eq false
      expect(cell.x).to eq 4
      expect(cell.y).to eq 5
    end

    it 'Returns . if dead and 0 if alive for to_s method' do
      cell1 = Cell.new(true, 5, 5)
      cell2 = Cell.new(false, 5, 5)
      expect(cell1.to_s).to eq '0'
      expect(cell2.to_s).to eq '.'
    end
  end
end
