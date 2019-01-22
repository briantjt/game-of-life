require_relative '../shared/cell_shared'

# Creates a grid of cells and makes calls to cell methods
class WorldMulti
  attr_reader :generation, :matrix

  def initialize(matrix, size, generation)
    @matrix = matrix
    @size = size
    @generation = generation
  end

  def next_gen
    next_gen_matrix = Array.new(@size) { Array.new(@size) }
    thread1 = Thread.new do
      (@size / 2).times do |row|
        @size.times do |column|
          cell_alive = @matrix[row][column].still_alive(@matrix, @size)
          next_gen_matrix[row][column] = CellShared.new(cell_alive, row, column)
        end
      end
    end
    thread2 = Thread.new do
      Range.new(@size / 2, @size - 1).each do |row|
        @size.times do |column|
          cell_alive = @matrix[row][column].still_alive(@matrix, @size)
          next_gen_matrix[row][column] = CellShared.new(cell_alive, row, column)
        end
      end
    end
    thread1.join
    thread2.join
    World.new(next_gen_matrix, @size, @generation + 1)
  end

  def to_s
    string = ''
    @matrix.each do |row|
      string += row.join(' ') + "\n"
    end
    string
  end
end
