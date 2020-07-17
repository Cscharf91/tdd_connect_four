require 'spec_helper'

describe Cell do
    describe "#initalize" do
        it "is initialized with a value of ''" do
            cell = Cell.new
            expect(cell.value).to eq ''
        end
    end
end