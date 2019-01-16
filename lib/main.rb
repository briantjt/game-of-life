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
    world.tick
    sleep(1)
  end
end

puts 'Enter World Size (Ideally less than 50):'
size = gets.chomp.to_i
game(size)
