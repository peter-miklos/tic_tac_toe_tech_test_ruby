require 'player'

describe Player do

  subject(:player) {described_class.new("John")}

  context "#name" do
    it "returns the player's name" do
      expect(player.name).to eq "John"
    end

  end
end
