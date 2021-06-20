class Rover
  def initialize(x_position, y_position, direction)
    @x_position = x_position
    @y_position = y_position
    @direction = direction
  end

  private

  attr_reader :x_position, :y_positions, :direction
end