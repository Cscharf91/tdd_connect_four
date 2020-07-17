require 'pry'
require_relative 'cell.rb'
require 'matrix'
class Board
    attr_reader :grid
    def initialize(input = {})
        @grid = input.fetch(:grid, default_grid)
    end

    def get_cell(x, y)
        grid[y][x]
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

    def winner?
        if four_in_a_row_rows(grid) == true ||
        four_in_a_row_rows(grid.transpose) == true ||
        four_in_a_row_rows(grid.diagonals) == true
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

    private

    def default_grid
        Array.new(6) { Array.new(7) { Cell.new } }
    end
end
