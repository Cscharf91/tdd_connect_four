require 'spec_helper'

describe Board do
    describe "#initialize" do
        it "creates a board with a grid" do
            expect { Board.new(grid: "grid") }.to_not raise_error
        end
    end

    describe "#grid" do
        it "returns the grid" do
            board = Board.new(grid: "grid")
            expect(board.grid).to eq "grid"
        end
    end

    describe "#get_cell" do
        it "returns x, y coordinates" do
            grid = [["", "", ""], ["", "", "something"], ["", "", ""]]
            board = Board.new(grid: grid)
            expect(board.get_cell(2, 1)).to eq "something"
        end
    end

    describe "#set_cell" do
        it "updates the value of a cell at x, y to a value" do
            Cat = Struct.new(:value)
            grid = [[Cat.new("cool"), "", ""], ["", "", ""], ["", "", ""]]
            board = Board.new(grid: grid)
            board.set_cell(0, 0, "meow")
            expect(board.get_cell(0,0).value).to eq "meow"
        end
    end

    describe "#four_in_a_row_rows" do
        it "checks an array for four in a row" do
            grid = [["X", "X", "X", "", "", "", ""], ["O", "O", "O", "O", "X", "X"]]
            board = Board.new(grid: grid)
            expect(board.four_in_a_row_rows(grid)).to eq true
        end

        it "checks an array for four in a column" do
            grid = [["", "X", ""], ["", "X", ""], ["", "X", ""], ["", "X", ""], ["", "", ""]]
            new_grid = grid.transpose
            board = Board.new(grid: new_grid)
            expect(board.four_in_a_row_rows(new_grid)).to eq true
        end

        it "checks an array for four diagonally" do
            grid = [
                ["", "", "", "", "", "", ""],
                ["", "", "", "", "", "", ""],
                ["", "", "", "X", "", "", ""],
                ["", "", "X", "", "", "", ""],
                ["", "X", "", "", "", "", ""],
                ["X", "", "", "", "", "", ""]
            ]
            board = Board.new(grid: grid)
            new_grid = grid.diagonals
            expect(board.four_in_a_row_rows(new_grid)).to eq true
        end
    end

    TestCell = Struct.new(:value)
    let(:x_cell) { TestCell.new("X") }
    let(:y_cell) { TestCell.new("Y") }
    let(:empty) { TestCell.new("") }
    describe "#game_over" do
        it "returns :winner when winning condition is found in cells" do
            grid = [
                [x_cell, y_cell, y_cell, y_cell, x_cell, y_cell, x_cell],
                [x_cell, x_cell, y_cell, x_cell, y_cell, x_cell, y_cell],
                [y_cell, y_cell, x_cell, y_cell, x_cell, x_cell, x_cell],
                [y_cell, y_cell, x_cell, y_cell, x_cell, x_cell, x_cell]
            ]
            board = Board.new(grid: grid)
            expect(board.game_over).to eq :winner
        end
    end

    
end

