#!/usr/bin/env ruby

require_relative 'world'

# Initializes the world and outputs the state to the console
class Game
  def initialize(size)
    @size = size
  end

  def start
    matrix = Array.new(@size) { Array.new(@size) }
    world = World.new(matrix, size)
    world.fill_grid
    system 'clear'
    # Saves cursor position to be at the start of the console
    print "\e[s"
    loop do
      # Moves cursor back to the saved position i.e. the beginning
      print "\e[u"
      puts "Generation: #{world.generation}"
      print world
      world.tick
      sleep(1)
    end
  end
end
