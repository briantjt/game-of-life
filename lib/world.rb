require_relative 'cell'

NEIGHBOUR_UNITS = [{ column: -1, row: -1 },
                   { column: 0, row: -1 },
                   { column: 1, row: -1 },
                   { column: -1, row: 0 },
                   { column: 1, row: 0 },
                   { column: -1, row: 1 },
                   { column: 0, row: 1 },
                   { column: 1, row: 1 }].freeze
# Creates a grid of cells and makes calls to cell methods
class World
  attr_reader :size, :generation
  attr_accessor :grid

  def initialize(size)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
    @generation = 1
  end

  def fill_grid(random: true)
    size.times do |row|
      size.times do |column|
        grid[row][column] = Cell.new(random ? rand <= 0.1 : false, row, column)
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
      row.each do |cell|
        cell.evolve
      end
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
