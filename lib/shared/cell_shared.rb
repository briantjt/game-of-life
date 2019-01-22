NEIGHBOUR_UNITS = [{ column: -1, row: -1 },
                   { column: 0, row: -1 },
                   { column: 1, row: -1 },
                   { column: -1, row: 0 },
                   { column: 1, row: 0 },
                   { column: -1, row: 1 },
                   { column: 0, row: 1 },
                   { column: 1, row: 1 }].freeze

# Cell that switches between alive and dead depending on the number of neighbours it has
class CellShared
  attr_reader :alive, :row, :column, :neighbours
  def initialize(alive, row, column)
    @alive = alive
    @row = row
    @column = column
  end

  def still_alive(grid, size)
    neighbours = count_neighbours(grid, size)
    return true if !@alive && (neighbours == 3)
    return true if @alive && ([2, 3].include? neighbours)

    false
  end

  def to_s
    @alive ? '0' : '.'
  end

  private

  def count_neighbours(grid, size)
    count = 0
    NEIGHBOUR_UNITS.each do |coords|
      abs_row = @row + coords[:row]
      abs_col = @column + coords[:column]
      if (abs_row >= 0) && (abs_col >= 0) && (abs_row < size) && (abs_col < size)
        cell = grid[abs_row][abs_col]
        count += 1 if cell.alive
      end
    end
    count
  end
end
