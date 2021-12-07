require 'pry'

class TicTacToe

    attr_accessor :board, :winner

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
        @winner = ""
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

    def current_player
        current_player = "X"
        current_count = turn_count
        if current_count.odd?
            current_player = "O"
        end
        return current_player
    end

    def turn
        puts "Choose a number 1-9 of where you want to play your next move:"
        user_input = gets.chomp
        selected_index = input_to_index(user_input)
        token = current_player
        if valid_move?(selected_index)
            move(selected_index, token)
            display_board
        else
            puts "Invalid move. Please try again:"
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            if self.board[combo[0]] == "X" && self.board[combo[1]] == "X" && self.board[combo[2]] == "X"
                self.winner = "X"
                return combo
            elsif self.board[combo[0]] == "O" && self.board[combo[1]] == "O" && self.board[combo[2]] == "O"
                self.winner = "O"
                return combo
            end
        end
        return false
    end

    def full? 
        self.board.each do |n|
            if n == " "
                return false
            end
        end
        return true
    end

    def draw?
        if full? && won? == false
            return true
        else
            return false
        end
    end

    def over?
        if won? || full?
            return true
        else
            return false
        end
    end

    def winner
        # binding.pry
        # if self.winner != ""
        #     binding.pry
        #     return self.winner
        # end
        # if won?
        #     binding.pry
        #     return self.winner
        # end
    end

end

# game2 = TicTacToe.new
# game2.board = ["O", "O", "O", " ", "X", " ", "X", " ", "X"]
# game2.turn_count
# puts game2.board
# game2.turn
# puts game2.won?