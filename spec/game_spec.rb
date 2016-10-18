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

  context "#play" do
    it "raises error if game is over" do
      game.instance_variable_set(:@winner, player_1)
      expect{game.play(player_1, 1, 1)}.to raise_error(RuntimeError)
    end

    it "raises error if coordinates are not valid" do
      expect{game.play(player_1, 2, 5)}.to raise_error(RuntimeError)
    end

    it "raises error if the same player wants to play the next turn too" do
      game.play(player_1, 0, 1)
      expect {game.play(player_1, 0, 2)}.to raise_error(RuntimeError)
    end

    it "player_1 wins the game if all fields are claimed in a row" do
      game.play(player_1, 0, 0)
      game.play(player_2, 1, 1)
      game.play(player_1, 1, 0)
      game.play(player_2, 2, 1)
      game.play(player_1, 2, 0)
      expect(game.show_winner).to eq player_1
    end

    it "player_1 wins the game if all fields are claimed in a column" do
      game.play(player_1, 0, 0)
      game.play(player_2, 1, 1)
      game.play(player_1, 0, 1)
      game.play(player_2, 2, 1)
      game.play(player_1, 0, 2)
      expect(game.show_winner).to eq player_1
    end

    it "player_1 wins the game if all fields are claimed in diagonal" do
      game.play(player_1, 0, 0)
      game.play(player_2, 1, 0)
      game.play(player_1, 1, 1)
      game.play(player_2, 2, 1)
      game.play(player_1, 2, 2)
      expect(game.show_winner).to eq player_1
    end

  end

  context "#show_grid" do
    it "returns the current grid" do
      game.play(player_1, 2, 1)
      expect(game.show_grid).to eq [[nil, nil, nil], [nil, nil, player_1], [nil, nil, nil]]
    end
  end

  context "#show_winner" do
    it "returns the winner, if there is any, otherwise nil" do
      game.instance_variable_set(:@winner, player_2)
      expect(game.show_winner).to eq player_2
    end
  end


end
