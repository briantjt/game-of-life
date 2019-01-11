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
    it 'Assigns the correct number of neighbours to each cell' do
      world1 = World.new(2, random: false)
      world1.grid[0][0] = Cell.new(true)
      world1.grid[0][1] = Cell.new(true)
      world1.assign_neighbours
      expect(world1.grid[0][0].neighbours).to eq 1
      expect(world1.grid[0][1].neighbours).to eq 1
      expect(world1.grid[1][0].neighbours).to eq 2
      expect(world1.grid[1][1].neighbours).to eq 2
    end
  end
  context "Game state advancement" do
    before :example do
      @world = World.new(3, random: false)
      @world.grid[0][0] = Cell.new(true)
      @world.grid[0][1] = Cell.new(true)
      @world.grid[0][2] = Cell.new(true)
      @world.grid[1][0] = Cell.new(true)
      @world.grid[1][1] = Cell.new(true)
      @world.assign_neighbours
      @world.tick
    end
    
    it "Cells die in the next iteration if it has more than 3 neighbours" do
      expect(@world.grid[1][1].alive).to eq false
      expect(@world.grid[0][1].alive).to eq false
    end
    
    it "Cells are alive in the next iteration if it has 2 or 3 neighbours" do
      expect(@world.grid[0][0].alive).to eq true
      expect(@world.grid[0][2].alive).to eq true
      expect(@world.grid[1][0].alive).to eq true
    end
    
    it "Dead cells resurrect in the next iteration if it has exactly 3 neighbours" do
      world2 = World.new(3, random: false)
      world2.grid[0][0] = Cell.new(true)
      world2.assign_neighbours
      world2.tick
      expect(world2.grid[0][0].alive).to eq false
    end
    
    it "Correct number of neighbours assigned after each tick" do
      puts
      @world.grid.each do |row|
        puts row.join("")
      end
      expect(@world.grid[0][0].neighbours).to eq 1
      expect(@world.grid[0][1].neighbours).to eq 4
      expect(@world.grid[0][2].neighbours).to eq 1
      expect(@world.grid[1][0].neighbours).to eq 1
      expect(@world.grid[1][1].neighbours).to eq 4
      expect(@world.grid[1][2].neighbours).to eq 1
      expect(@world.grid[2][0].neighbours).to eq 1
      expect(@world.grid[2][1].neighbours).to eq 2
      expect(@world.grid[2][2].neighbours).to eq 1
    end
    
  end
  
end
