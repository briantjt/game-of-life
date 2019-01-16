require_relative 'cell'

# Creates a grid of cells and makes calls to cell methods
class World
  attr_reader :generation, :matrix

  def initialize(matrix, size, generation)
    @matrix = matrix
    @size = size
    @generation = generation
  end

  def next_gen
    next_gen_matrix = Array.new(@size) { Array.new(@size) }
    @size.times do |row|
      @size.times do |column|
        cell_alive = @matrix[row][column].still_alive(@matrix, @size)
        next_gen_matrix[row][column] = Cell.new(cell_alive, row, column)
      end
    end
    World.new(next_gen_matrix, @size, @generation+1)
  end

  def to_s
    string = ''
    @matrix.each do |row|
      string += row.join(' ') + "\n"
    end
    string
  end
end
