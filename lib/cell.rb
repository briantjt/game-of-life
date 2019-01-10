# Cell that stores the state and coordinates of the cell
class Cell
  attr_accessor :alive, :x, :y, :neighbours
  def initialize(alive, x, y)
    @alive = alive
    @x = x
    @y = y
    @neighbours = 0
  end

  def to_s
    @alive ? '0' : '.'
  end
end
