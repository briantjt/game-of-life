
# Initializes the world and outputs the state to the console
# Class shared by multithreaded and immutable implementations
class GameShared
  def initialize(size)
    @size = size
  end

  def start(world_class)
    matrix = Array.new(@size) { Array.new(@size) }
    @size.times do |row|
      @size.times do |column|
        matrix[row][column] = CellShared.new(rand < 0.2, row, column)
      end
    end
    world = world_class.new(matrix, @size, 1)
    system 'clear'
    # Saves cursor position to be at the start of the console
    print "\e[s"
    loop do
      print_world world
      world = world.next_gen
      sleep(0.5)
    end
  end

  private

  def print_world(world)
    # Moves cursor back to the saved position i.e. the beginning
    print "\e[u"
    puts "Generation: #{world.generation}"
    print world
  end
end
