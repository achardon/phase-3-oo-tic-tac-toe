require 'pry'

class TicTacToe

    attr_accessor :board

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
    end

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def display_board
        puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} \n-----------\n #{self.board[3]} | #{self.board[4]} | #{self.board[5]} \n-----------\n #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, token = "X")
        self.board[index] = token
    end

    def position_taken?(index)
        self.board[index] != " "
    end

    def valid_move?(index)
        # if index != /[0-8]/ || self.position_taken?(index)
        if index < 0 || index > 8 || self.position_taken?(index)
            return false
        end
        return true
    end

    def turn_count
        count = 0
        self.board.each do |n|
            # binding.pry
            if n != " "
                count += 1
            end
        end
        count
    end

end

game = TicTacToe.new
game.display_board
game.board = ["O", " ", "O", " ", "X", " ", " ", " ", "X"]
game.turn_count