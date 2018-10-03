class Board

    def initialize(grid = self.class.default_grid)
        @grid = grid
    end

    def self.default_grid
        Array.new(10){Array.new(10)}
    end

    def count
        @grid.reduce(0){|a,c| a + c.count(:s)}
    end

    def empty?(pos=false)
        if !pos
            count == 0
        else
            x, y = pos
            !@grid[x][y]
        end
    end

    def full?
        @grid.all? { |arr| arr.all? { |el| el } }
    end

    def place_random_ship
        raise "Board is Full" if full?
        while true
            x = rand(0...@grid.length)
            y = rand(0...@grid[0].length)
            if empty?([x,y])
                @grid[x][y] = :s
                break
            end
        end
    end

    def won?
        count == 0
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, sym)
        x, y = pos
        @grid[x][y] = sym
    end
end
