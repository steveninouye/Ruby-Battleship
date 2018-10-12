module Coordinate_Calculator
  def calculate_coord(n)
    row, col = @start_pos
    row = row.send(@operator, n) if @col
    col = col.send(@operator, n) if !@col
    [row, col]
  end
end
