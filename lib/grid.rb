class Grid

  def initialize(grid_size)
    @grid_size = grid_size
    @grid_content = Array.new(grid_size){Array.new(grid_size)}
  end

  def valid_choice?(x, y)
    inside_grid?(x, y) && position_available?(x, y)
  end

  def show_grid
    
  end


  private

  def inside_grid?(x, y)
    x >= 0 && x < @grid_size && y >= 0 && y < @grid_size
  end

  def position_available?(x, y)
    @grid_content[y][x] == nil
  end

end
