class Grid

  def initialize(grid_size)
    @grid_size = grid_size
    @grid_content = Array.new(grid_size){Array.new(grid_size)}
  end

  def claim_field(player, x, y)
    @grid_content[y][x] = player
  end

  def valid_choice?(x, y)
    inside_grid?(x, y) && position_available?(x, y)
  end

  def show_grid
    @grid_content.dup
  end

  def grid_full?
    !@grid_content.flatten.include?(nil)
  end

  def player_wins?(player)
    wins_with_a_row?(player) || wins_with_a_column(player) ||
    wins_with_a_diagonal(player)
  end

  private

  def inside_grid?(x, y)
    x >= 0 && x < @grid_size && y >= 0 && y < @grid_size
  end

  def position_available?(x, y)
    @grid_content[y][x] == nil
  end

  def wins_with_a_row?(player)
    @grid_content.include?(Array.new(@grid_size){player})
  end

  def wins_with_a_column(player)
    @grid_content.transpose.include?(Array.new(@grid_size){player})
  end

  def wins_with_a_diagonal(player)
    player_array = Array.new(@grid_size){player}
    (0...@grid_size).map {|i| @grid_content[i][i] } == player_array ||
    (0...@grid_size).map { |i| @grid_content.reverse[i][i]} == player_array
  end

end
