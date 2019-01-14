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
      world.fill_grid
      world.grid.each do |row|
        row.each do |cell|
          expect(cell.class).to eq Cell
        end
      end
    end
  end
  context 'Game state advancement' do
    before :example do
      @world = World.new(3)
      @world.fill_grid(random: false)
      @world.grid[0][0] = Cell.new(true, 0, 0)
      @world.grid[0][1] = Cell.new(true, 0, 1)
      @world.grid[0][2] = Cell.new(true, 0, 2)
      @world.grid[1][0] = Cell.new(true, 1, 0)
      @world.grid[1][1] = Cell.new(true, 1, 1)
      @world.tick
    end

    it 'Cells die in the next iteration if it has more than 3 neighbours' do
      expect(@world.grid[1][1].alive).to eq false
      expect(@world.grid[0][1].alive).to eq false
    end

    it 'Cells are alive in the next iteration if it has 2 or 3 neighbours' do
      expect(@world.grid[0][0].alive).to eq true
      expect(@world.grid[0][2].alive).to eq true
      expect(@world.grid[1][0].alive).to eq true
    end

    it 'Dead cells resurrect in the next iteration if it has exactly 3 neighbours' do
      world2 = World.new(3)
      world2.fill_grid
      world2.grid[0][0] = Cell.new(true, 0, 0)
      world2.tick
      expect(world2.grid[0][0].alive).to eq false
    end
  end
end
