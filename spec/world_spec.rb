require 'world'

RSpec.describe 'World class' do
  context 'World creation' do
    it 'Creates a 2D grid of cells of n length' do
      world = World.new(10)
      expect(world.grid.length).to eq 10
      world.grid.each do |row|
        expect(row.length).to eq 10
      end
    end

    it 'Fills the grid with cells with their appropriate x and y coordinates' do
      world = World.new(3)
      world.grid.each do |row|
        row.each do |cell|
          expect(cell.class).to eq Cell
        end
      end
      world.size.times do |y|
        world.size.times do |x|
          world.grid[x][y].x = x
          world.grid[x][y].y = x
        end
      end

    end
  end
end
