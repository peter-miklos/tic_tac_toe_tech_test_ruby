require 'game'

describe Game do

  let(:player_1) {double(:player_1, name: "John")}
  let(:player_2) {double(:player_2, name: "Jim")}
  subject(:game) {described_class.new(player_1, player_2)}

  context "#player_1" do
    it "returns the first player" do
      expect(game.player_1).to eq player_1
    end
  end

  context "#player_2" do
    it "returns the second player" do
      expect(game.player_2).to eq player_2
    end
  end


end
