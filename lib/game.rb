class Game

  DEF_GRID_SIZE = 3

  def initialize(player_1, player_2, grid_class: Grid, grid_size: DEF_GRID_SIZE)
    @players = [player_1, player_2]
    @grid = grid_class.new(grid_size)
    @grid_size = grid_size
    @grid_old = Array.new(grid_size){Array.new(grid_size)}
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
    @grid.show_grid
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
    raise "Invalid choice" unless @grid.valid_choice?(x, y)
  end

  def game_over?
    !@grid_old.flatten.include?(nil) || @winner != nil
  end

  def valid_player?(player)
    @players_in_turns.empty? || @players_in_turns.last != player
  end

  # def valid_choice?(x, y)
  #   inside_grid?(x, y) && position_available?(x, y)
  # end
  #
  # def inside_grid?(x, y)
  #   x >= 0 && x < @grid_size && y >= 0 && y < @grid_size
  # end
  #
  # def position_available?(x, y)
  #   @grid_old[y][x] == nil
  # end

  def complete_turn(player, x, y)
    @grid_old[y][x] = player
    @players_in_turns << player
    @winner = player if player_wins?(player)
    "#{player.name} won!" if @winner == player
  end

  def player_wins?(player)
    wins_with_a_row?(player) || wins_with_a_column(player) || wins_with_a_diagonal(player)
  end

  def wins_with_a_row?(player)
    @grid_old.include?(Array.new(@grid_size){player})
  end

  def wins_with_a_column(player)
    @grid_old.transpose.include?(Array.new(@grid_size){player})
  end

  def wins_with_a_diagonal(player)
    player_array = Array.new(@grid_size){player}
    (0...@grid_size).map {|i| @grid_old[i][i] } == player_array ||
    (0...@grid_size).map { |i| @grid_old.reverse[i][i]} == player_array
  end

end
