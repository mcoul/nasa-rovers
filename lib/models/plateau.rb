class Plateau
  def initialize(max_x, max_y)
    @max_x = max_x
    @max_y = max_y
  end

  private

  attr_reader :max_x, :max_y
end