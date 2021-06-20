class Rover
  attr_reader :x_position, :y_position, :direction

  def initialize(x_position, y_position, direction)
    @x_position = x_position
    @y_position = y_position
    change_direction(direction)
  end

  def change_direction(direction)
    @direction = direction
    @direction.context = self
  end

  def turn_left
    @direction.turn_left
  end

  def turn_right
    @direction.turn_right
  end
end
