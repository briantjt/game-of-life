require 'cell'

RSpec.describe 'Cell' do
  context 'Cell methods' do
    it 'Cell has an alive boolean, row and column integer attributes' do
      cell = Cell.new(false, 0, 1)
      expect(cell.alive).to eq false
      expect(cell.row).to eq 0
      expect(cell.column).to eq 1
    end

    it 'Cell counts and assigns the number of neighbours correctly' do
      world = Array.new(3) { Array.new(3) }
      3.times do |row|
        3.times do |column|
          world[row][column] = Cell.new(false, row, column)
        end
      end
      world[0][0] = Cell.new(true, 0, 0)
      world[0][1] = Cell.new(true, 0, 1)
      world[1][0].assign_neighbours(world, 3)
      world[1][1].assign_neighbours(world, 3)
      expect(world[1][0].neighbours).to eq 2
      expect(world[1][1].neighbours).to eq 2
    end

    it 'Returns . if dead and 0 if alive for to_s method' do
      cell1 = Cell.new(true, 0, 1)
      cell2 = Cell.new(false, 2, 3)
      expect(cell1.to_s).to eq '0'
      expect(cell2.to_s).to eq '.'
    end
  end

  context 'Cell evolution' do
    before :example do
      @world = Array.new(3) { Array.new(3) }
      3.times do |row|
        3.times do |column|
          @world[row][column] = Cell.new(false, row, column)
        end
      end
      @world[0][0] = Cell.new(true, 0, 0)
      @world[0][1] = Cell.new(true, 0, 1)
      @world[0][2] = Cell.new(true, 0, 2)
      @world[1][0] = Cell.new(true, 1, 0)
      @world[1][1] = Cell.new(true, 1, 1)
      @world.each do |row|
        row.each do |cell|
          cell.assign_neighbours(@world, 3)
        end
      end
      @world.each do |row|
        row.each(&:evolve)
      end
    end

    it 'Cells die in the next iteration if it has more than 3 neighbours' do
      expect(@world[1][1].alive).to eq false
      expect(@world[0][1].alive).to eq false
    end

    it 'Cells are alive in the next iteration if it has 2 or 3 neighbours' do
      expect(@world[0][0].alive).to eq true
      expect(@world[0][2].alive).to eq true
      expect(@world[1][0].alive).to eq true
    end

    it 'Dead cells resurrect in the next iteration if it has exactly 3 neighbours' do
      world = Array.new(3) { Array.new(3) }
      3.times do |row|
        3.times do |column|
          world[row][column] = Cell.new(false, row, column)
        end
      end
      world[0][0] = Cell.new(true, 0, 0)
      world[0][0].assign_neighbours(world, 3)
      world[0][0].evolve
      expect(world[0][0].alive).to eq false
    end
  end
end
