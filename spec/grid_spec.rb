require "grid"

describe Grid do

  let(:player_1) {double(:player_1, name: "John")}
  let(:player_2) {double(:player_2, name: "Jim")}
  subject(:grid) {described_class.new(3)}

  context "#claim_field" do
    it "add player to the claimed field" do
      grid.claim_field(player_1, 1, 1)
      expect(grid.show_grid).to eq [[nil, nil, nil], [nil, player_1, nil], [nil, nil, nil]]
    end
  end

  context "#valid_choice?" do
    it "returns true if the field is not taken" do
      expect(grid.valid_choice?(1, 1)).to be_truthy
    end

    it "returns false if the field is taken" do

    end
  end

  context "#show_grid" do
    it "returns the current grid" do
      grid.claim_field(player_1, 2, 1)
      expect(grid.show_grid).to eq [[nil, nil, nil], [nil, nil, player_1], [nil, nil, nil]]
    end
  end

  context "#grid_full?" do
    it "returns true if there is no more empty field in the grid" do

    end

    it "returns false if there is still at least one empty field in the grid" do
      expect(grid.grid_full?).to be_falsy
    end
  end

  context "#player_wins?" do
    it "player_1 wins the game if all fields are claimed in a row" do
      grid.claim_field(player_1, 0, 0)
      grid.claim_field(player_2, 1, 1)
      grid.claim_field(player_1, 1, 0)
      grid.claim_field(player_2, 2, 1)
      grid.claim_field(player_1, 2, 0)
      expect(grid.player_wins?(player_1)).to be_truthy
    end

    it "player_1 wins the game if all fields are claimed in a column" do
      grid.claim_field(player_1, 0, 0)
      grid.claim_field(player_2, 1, 1)
      grid.claim_field(player_1, 0, 1)
      grid.claim_field(player_2, 2, 1)
      grid.claim_field(player_1, 0, 2)
      expect(grid.player_wins?(player_1)).to be_truthy
    end

    it "player_1 wins the game if all fields are claimed in diagonal" do
      grid.claim_field(player_1, 0, 0)
      grid.claim_field(player_2, 1, 0)
      grid.claim_field(player_1, 1, 1)
      grid.claim_field(player_2, 2, 1)
      grid.claim_field(player_1, 2, 2)
      expect(grid.player_wins?(player_1)).to be_truthy
    end

  end
end
