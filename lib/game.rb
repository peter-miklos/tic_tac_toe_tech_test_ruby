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
    @grid
  end

  def show_winner
    @winner
  end

  def play(player, x, y)
    raise "Game Over" if game_over?
    raise "Invalid player" unless valid_player?(player)
    raise "Invalid choice" unless valid_choice?(x, y)
    @grid[y][x] = player
    @players_in_turns << player
    @winner = player if player_won?(player)
  end

  private

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

  def player_won?(player)
    @grid.include?([player, player, player]) || @grid.transpose.include?([player, player, player]) ||
    (0..2).collect {|i| @grid[i][i] } == [player, player, player] || (0..2).collect { |i| @grid.reverse[i][i]} == [player, player, player]
  end

end
