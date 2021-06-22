class Plateau
  def initialize(max_x, max_y)
    @max_x = max_x.to_i
    @max_y = max_y.to_i
  end

  def out_of_bounds?(x_pos, y_pos)
    x_pos > @max_x || y_pos > @max_y || x_pos.negative? || y_pos.negative?
  end
end
