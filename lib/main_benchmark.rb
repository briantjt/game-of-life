#!/usr/bin/env ruby

require_relative '../lib/game'

size = gets.chomp.to_i
Game.new(size).start
