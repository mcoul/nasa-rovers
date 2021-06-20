class Plateau
  def initialize(max_x, max_y)
    @max_x = max_x.to_i
    @max_y = max_y.to_i
  end

  def out_of_bounds?(x, y)
    return x >= @max_x || y >= @max_y || x < 0 || y < 0
  end
end
