require 'cell'

# World that controls behaviour of cells
class World
  attr_reader :grid, :size

  def initialize(size)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
    fill_grid
  end

  def fill_grid
    size.times do |y|
      size.times do |x|
        @grid[x][y] = Cell.new(rand <= 0.1, x, y)
      end
    end
  end

  
end
