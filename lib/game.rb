class Game

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @grid = Array.new(3){Array.new(3)}
    @winner = nil
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def play(player, x, y)
    raise "Game Over" if game_over?
    raise "Invalid choice" unless valid_choice?(x, y)
  end

  private

  def game_over?
    !@grid.flatten.include?(nil) || @winner != nil
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

end
