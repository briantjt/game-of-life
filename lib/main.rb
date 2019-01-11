require_relative 'world'

def game
  world = World.new(40)
  world.fill_grid
  world.assign_neighbours
  generation = 1
  system 'clear'
  print "\033[s"
  loop do
    print "\033[u"
    puts "Generation: #{generation}"
    print world
    world.tick
    generation += 1
    sleep(1)
  end
end

game
