class Board
    def initialize(board)
        @board = create_board(board)
    end

    def create_board(board)
        Array.new(board[0]){ Array.new(board[1]) }
    end
end