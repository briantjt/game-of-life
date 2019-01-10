require 'cell'

# World that controls behaviour of cells
class World
  attr_reader :grid
  def initialize(size)
    @grid = Array.new(size) { Array.new(size) }
  end
end
