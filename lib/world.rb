require_relative 'cell'

# Creates a grid of cells and makes calls to cell methods
class World
  attr_reader :generation, :grid

  def initialize(matrix, size)
    @matrix = matrix
    @size = size
    @generation = 1
  end


  def tick
    @matrix.each do |row|
      row.each do |cell|
        cell.assign_neighbours(@matrix, @size)
      end
    end
    @matrix.each do |row|
      row.each(&:evolve)
    end
    @generation += 1
  end

  def to_s
    string = ''
    @matrix.each do |row|
      string += row.join(' ') + "\n"
    end
    string
  end
end
