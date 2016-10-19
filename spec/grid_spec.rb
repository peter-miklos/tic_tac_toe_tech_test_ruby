require "grid"

describe Grid do

  subject(:grid) {described_class.new(3)}

  context "#valid_choice?" do
    it "returns true if the field is not taken" do
      expect(grid.valid_choice?(1, 1)).to be_truthy
    end

    it "returns false if the field is taken" do

    end
  end

  context "#show_grid" do
    it "returns the current grid" do
      # game.play(player_1, 2, 1)
      # expect(game.show_grid).to eq [[nil, nil, nil], [nil, nil, player_1], [nil, nil, nil]]
    end
  end
end
