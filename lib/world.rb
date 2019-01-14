require_relative 'cell'

# Creates a grid of cells and makes calls to cell methods
class World
  attr_reader :generation

  def initialize(matrix, size)
    @grid = matrix
    @size = size
    @generation = 1
  end

  def fill_grid(random: true)
    @size.times do |row|
      @size.times do |column|
        @grid[row][column] = Cell.new(random ? rand <= 0.2 : false, row, column)
      end
    end
  end

  def tick
    @grid.each do |row|
      row.each do |cell|
        cell.assign_neighbours(@grid, @size)
      end
    end
    @grid.each do |row|
      row.each(&:evolve)
    end
    @generation += 1
  end

  def to_s
    string = ''
    @grid.each do |row|
      string += row.join(' ') + "\n"
    end
    string
  end
end
