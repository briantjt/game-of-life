#!/usr/bin/env ruby
require 'benchmark'
include Benchmark
require_relative 'world'

def game(size)
  matrix = Array.new(size) { Array.new(size) }
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
    break if world.generation == 1000

    world.tick
  end
end

results = Benchmark.measure { game(50) }

system "clear"
puts CAPTION
puts results
