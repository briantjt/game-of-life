require_relative '../../lib/immutable/world_immutable.rb'
require_relative '../../lib/shared/cell_shared.rb'

RSpec.describe 'World class' do
  context 'World creation' do
    it 'Creates a matrix of n length' do
      matrix = Array.new(10) { Array.new(10) }
      world = WorldImmutable.new(matrix, 10, 1)
      expect(world.matrix.length).to eq 10
      world.matrix.each do |row|
        expect(row.length).to eq 10
      end
    end
  end
  context 'Game state advancement' do
    before :example do
      matrix = Array.new(3) { Array.new(3) }
      3.times do |row|
        3.times do |column|
          matrix[row][column] = CellShared.new(false, row, column)
        end
      end
      @world = WorldImmutable.new(matrix, 3, 1)
    end

    it 'Generation counter gets incremented per evolution' do
      expect(@world.next_gen.generation).to eq 2
    end
  end

  it 'Generates the correct string representation' do
    matrix1 = Array.new(3) { Array.new(3) }
    3.times do |row|
      3.times do |column|
        matrix1[row][column] = CellShared.new(false, row, column)
      end
    end
    matrix2 = Array.new(3) { Array.new(3) }
    3.times do |row|
      3.times do |column|
        matrix2[row][column] = CellShared.new(false, row, column)
      end
    end
    matrix2[0][0] = CellShared.new(true, 0, 0)
    world1 = WorldImmutable.new(matrix1, 3, 1)
    world2 = WorldImmutable.new(matrix2, 3, 1)
    expect(world1.to_s).to eq ". . .\n. . .\n. . .\n"
    expect(world2.to_s).to eq "0 . .\n. . .\n. . .\n"
  end
end
