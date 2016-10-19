class Game

  DEF_GRID_SIZE = 3

  def initialize(player_1, player_2, grid_class: Grid, grid_size: DEF_GRID_SIZE)
    @players = [player_1, player_2]
    @grid = grid_class.new(grid_size)
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
    @grid.grid_full? || @winner != nil
  end

  def valid_player?(player)
    @players_in_turns.empty? || @players_in_turns.last != player
  end

  def complete_turn(player, x, y)
    @grid.claim_field(player, x, y)
    @players_in_turns << player
    @winner = player if @grid.player_wins?(player)
    "#{player.name} won!" if @winner == player
  end
end
