require 'spec_helper'

describe Player do
    describe "#initialize" do
        it "doesn't accept an empty {}" do
            expect { Player.new({}) }.to raise_error
        end
    end

    describe "#name" do
        it "returns the player's name" do
            input = { color: "X", name: "Name" }
            player = Player.new(input)
            expect(player.name).to eq "Name"
        end
    end

    describe "#color" do
        it "returns the player's color" do
            input = { color: "X", name: "Name" }
            player = Player.new(input)
            expect(player.color).to eq "X"
        end
    end
end