require 'world'

RSpec.describe 'World class' do
  context 'World creation' do
    it 'Creates a 2D grid of cells of n length' do
      array = Array.new(10) { Array.new(10) }
      world = World.new(array, 10)
      expect(world.grid.length).to eq 10
      world.grid.each do |row|
        expect(row.length).to eq 10
      end
    end
  end
  context 'Game state advancement' do
    before :example do
      array = Array.new(3) { Array.new(3) }
      @world = World.new(array, 3)
      @world.fill_grid(random: false)
      @world.tick
    end

    it 'Generation counter gets incremented per tick' do
      expect(@world.generation).to eq 2
    end
  end
end
