module Coordinate_Calculator
  def operation_passer(n)
    row, col = @start_pos
    row = row.send(@operator, n) if @row
    col = col.send(@operator, n) if !@row
    [row, col]
  end
end
