require_relative 'world'

def game
  world = World.new(40)
  world.fill_grid
  system 'clear'
  print "\033[s"
  loop do
    print "\033[u"
    puts "Generation: #{world.generation}"
    print world
    world.tick
    sleep(1)
  end
end

game
