require_relative 'cell'

NEIGHBOUR_UNITS = [{ column: -1, row: -1 },
                   { column: 0, row: -1 },
                   { column: 1, row: -1 },
                   { column: -1, row: 0 },
                   { column: 1, row: 0 },
                   { column: -1, row: 1 },
                   { column: 0, row: 1 },
                   { column: 1, row: 1 }].freeze
# World that controls behaviour of cells
class World
  attr_reader :size
  attr_accessor :grid

  def initialize(size, random: true)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
  end

  def fill_grid(random: true)
    size.times do |row|
      size.times do |column|
        grid[row][column] = Cell.new(random ? rand <= 0.1 : false)
      end
    end
  end

  def count_neighbours(row, column)
    count = 0
    NEIGHBOUR_UNITS.each do |coords|
      begin
        rel_row = row + coords[:row]
        rel_col = column + coords[:column]
        if rel_row >= 0 && rel_col >= 0
          cell = @grid[rel_row][rel_col]
          count += 1 if cell.alive
        end
      rescue NoMethodError
      end
    end
    count
  end

  def assign_neighbours
    size.times do |row|
      size.times do |column|
        count = count_neighbours(row, column)
        @grid[row][column].neighbours = count
      end
    end
  end

  def tick
    @grid.each do |row|
      row.each do |cell|
        cell.alive = false if (cell.neighbours > 3) || (cell.neighbours < 2)
        cell.alive = true if cell.neighbours == 3
      end
    end
    assign_neighbours
  end

  def to_s
    string = ''
    @grid.each do |row|
      string += row.join(' ') + "\n"
    end
    string
  end
end
