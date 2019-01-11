# Cell that stores the state and coordinates of the cell
class Cell
  attr_accessor :alive, :x, :y, :neighbours
  def initialize(alive)
    @alive = alive
    @neighbours = 0
  end

  def to_s
    @alive ? '0' : '.'
  end
end
