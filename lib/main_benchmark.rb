#!/usr/bin/env ruby
require 'benchmark'
require_relative 'game_benchmark'

Benchmark.bmbm do |x|
  x.report do
    Game.new(50, 1000).start
  end
end
