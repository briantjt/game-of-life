#!/usr/bin/env ruby
require 'benchmark'
include Benchmark

require_relative 'game_benchmark'

result = Benchmark.measure do
  Game.new(50, 1000).start
end

system "clear"
print 'Branch', CAPTION
print 'Immutable', result
