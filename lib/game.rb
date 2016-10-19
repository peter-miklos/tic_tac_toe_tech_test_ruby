class Game

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @grid = Array.new(3){Array.new(3)}
    @winner = nil
    @players_in_turns = []
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def show_grid
    @grid.dup
  end

  def show_winner
    @winner
  end

  def play(player, x, y)
    run_validations(player, x, y)
    complete_turn(player, x, y)
  end

  private

  def run_validations(player, x, y)
    raise "Game Over" if game_over?
    raise "Invalid player" unless valid_player?(player)
    raise "Invalid choice" unless valid_choice?(x, y)
  end

  def game_over?
    !@grid.flatten.include?(nil) || @winner != nil
  end

  def valid_player?(player)
    @players_in_turns.empty? || @players_in_turns.last != player
  end

  def valid_choice?(x, y)
    inside_grid?(x, y) && position_available?(x, y)
  end

  def inside_grid?(x, y)
    x >= 0 && x < @grid.length && y >= 0 && y < @grid.length
  end

  def position_available?(x, y)
    @grid[y][x] == nil
  end

  def complete_turn(player, x, y)
    @grid[y][x] = player
    @players_in_turns << player
    @winner = player if player_wins?(player)
    "#{player.name} won!" if @winner == player
  end

  def player_wins?(player)
    wins_with_a_row?(player) || wins_with_a_column(player) || wins_with_a_diagonal(player)
  end

  def wins_with_a_row?(player)
    @grid.include?(Array.new(3){player})
  end

  def wins_with_a_column(player)
    @grid.transpose.include?(Array.new(3){player})
  end

  def wins_with_a_diagonal(player)
    player_array = Array.new(3){player}
    (0..2).map {|i| @grid[i][i] } == player_array ||
    (0..2).map { |i| @grid.reverse[i][i]} == player_array
  end

end
