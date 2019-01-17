#!/usr/bin/env ruby

require_relative 'world'

# Initializes the world and outputs the state to the console
class Game
  def initialize(size, generations)
    @size = size
    @generations = generations
  end

  def start
    matrix = Array.new(@size) { Array.new(@size) }
    @size.times do |row|
      @size.times do |column|
        matrix[row][column] = Cell.new(rand < 0.2, row, column)
      end
    end
    world = World.new(matrix, @size, 1)
    system 'clear'
    # Saves cursor position to be at the start of the console
    print "\e[s"
    loop do
      print_world
      break if world.generation == @generations

      world = world.next_gen
    end
  end

  private

  def print_world(world)
    # Moves cursor back to the saved position i.e. the beginning
    print "\e[u"
    puts "Generation: #{world.generation}"
    print world
  end
end
