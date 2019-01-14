require_relative 'world'

def game
  world = World.new(40)
  world.fill_grid
  system 'clear'
  # Saves cursor position to be at the start of the console
  print "\033[s"
  loop do
    # Moves cursor back to the saved position i.e. the beginning
    print "\033[u"
    puts "Generation: #{world.generation}"
    print world
    world.tick
    sleep(1)
  end
end

game
