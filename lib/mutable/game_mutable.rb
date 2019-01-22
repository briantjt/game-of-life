#!/usr/bin/env ruby

require_relative 'world_mutable'

# Starts the world and loops it
class GameMutable
  def initialize(size)
    @size = size
  end

  def start
    matrix = Array.new(@size) { Array.new(@size) }
    world = WorldMutable.new(matrix, @size)
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
      sleep(0.5)
    end
  end
end
