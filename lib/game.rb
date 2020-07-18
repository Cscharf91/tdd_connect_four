class Game
    attr_reader :players, :board, :current_player, :other_player
    def initialize(players, board = Board.new)
        @players = players
        @board = board
        @current_player, @other_player = players.shuffle
    end

    def switch_players
        @current_player, @other_player = @other_player, @current_player
    end

    def ask_move
        "#{current_player.name}: Enter a number between 1-7 to choose which column to drop your piece:"
    end

    def get_move(move = gets.chomp)
        move_to_coordinate(move)
    end


    def move_to_coordinate(move)
        mapping = {
            "1" => [0, 0],
            "2" => [1, 0],
            "3" => [2, 0],
            "4" => [3, 0],
            "5" => [4, 0],
            "6" => [5, 0],
            "7" => [6, 0]
        }
        mapping[move]
    end

    def game_over_message
        return "#{current_player.name} won!" if board.game_over == :winner
        return "The game ended in a tie" if board.game_over == :draw
    end

    #begins the game, alternating turns and making sure each option is a valid choice, then displays the board
    def play
        puts "#{current_player.name} has randomly been selected as the first player"
        while true
          board.formatted_grid
          puts ""
          puts ask_move
          x, y = get_move
          while board.valid?(x) == false
            puts "Invalid option! Try again:"
            x, y = get_move
            board.valid?(x)
          end
          new_y = board.find_lowest_slot(x, y)
          board.set_cell(x, new_y, current_player.color)
          if board.game_over
            puts game_over_message
            board.formatted_grid
            return
          else
            switch_players
          end
        end
    end

end