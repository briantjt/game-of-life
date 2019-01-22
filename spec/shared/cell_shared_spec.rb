require_relative '../../lib/shared/cell_shared'

RSpec.describe 'Cell' do
  context 'Cell methods' do
    it 'Cell has an alive boolean, row and column integer attributes' do
      cell = CellShared.new(false, 0, 1)
      expect(cell.alive).to eq false
      expect(cell.row).to eq 0
      expect(cell.column).to eq 1
    end

    it 'Returns . if dead and 0 if alive for to_s method' do
      cell1 = CellShared.new(true, 0, 1)
      cell2 = CellShared.new(false, 2, 3)
      expect(cell1.to_s).to eq '0'
      expect(cell2.to_s).to eq '.'
    end
  end

  context 'Cell evolution' do
    before :example do
      @world = Array.new(3) { Array.new(3) }
      3.times do |row|
        3.times do |column|
          @world[row][column] = CellShared.new(false, row, column)
        end
      end
      @world[0][0] = CellShared.new(true, 0, 0)
      @world[0][1] = CellShared.new(true, 0, 1)
      @world[0][2] = CellShared.new(true, 0, 2)
      @world[1][0] = CellShared.new(true, 1, 0)
      @world[1][1] = CellShared.new(true, 1, 1)
    end

    it 'Cells die in the next iteration if it has more than 3 neighbours' do
      expect(@world[1][1].still_alive(@world, 3)).to eq false
      expect(@world[0][1].still_alive(@world, 3)).to eq false
    end

    it 'Cells are alive in the next iteration if it has 2 or 3 neighbours' do
      expect(@world[0][0].still_alive(@world, 3)).to eq true
      expect(@world[0][2].still_alive(@world, 3)).to eq true
      expect(@world[1][0].still_alive(@world, 3)).to eq true
    end

    it 'Dead cells resurrect in the next iteration if it has exactly 3 neighbours' do
      world = Array.new(3) { Array.new(3) }
      3.times do |row|
        3.times do |column|
          world[row][column] = CellShared.new(false, row, column)
        end
      end
      world[0][0] = CellShared.new(true, 0, 0)
      expect(world[0][0].still_alive(world, 3)).to eq false
    end
  end
end
