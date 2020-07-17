require 'pry'
require_relative 'cell.rb'
class Board
    attr_reader :grid
    def initialize(input = {})
        @grid = input.fetch(:grid, default_grid)
    end

    def get_cell(x, y)
        grid[y][x]
    end

    def get_cell_value(x, y)
        get_cell(x, y).value
    end

    def set_cell(x, y, value)
        get_cell(x, y).value = value
    end

    def game_over
        return :winner if winner?
        return :draw if draw?
        false
    end

    def draw?
        grid.flatten.map { |cell| cell.value }.none_empty?
    end

    def win_values
        new_grid = grid.each { |e| e.map { |cell| cell = cell.value } }
        new_grid
    end

    def winner?
        newgrid = win_values
        if four_in_a_row_rows(newgrid) == true ||
        four_in_a_row_rows(newgrid.transpose) == true ||
        four_in_a_row_rows(newgrid.diagonals) == true
            return true
        else
            return false
        end
    end

    def four_in_a_row_rows(arr)
        arr.each do |row|
            a = row.each_cons(4).find { |a| a.uniq.size == 1 && a.first != '' }
            return true unless a.nil?
        end
    end

    def formatted_grid
        grid.each do |row|
          puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
        end
    end

    def valid?(x)
        new_y = 0
        until new_y > 4
            return false if new_y == 0 && (get_cell_value(x, new_y) == "X" || get_cell_value(x, new_y) == "O")
            if get_cell_value(x, new_y + 1) == "X" || get_cell_value(x, new_y + 1) == "O"
                return true
            else
                new_y += 1
            end
        end
        return true
    end

    def find_lowest_slot(x, y)
        new_y = 0
        until new_y > 4
            if get_cell_value(x, new_y + 1) == "X" || get_cell_value(x, new_y + 1) == "O"
                return new_y
            else
                new_y += 1
            end
        end
        return new_y
    end

    private

    def default_grid
        Array.new(6) { Array.new(7) { Cell.new } }
    end
end