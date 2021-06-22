class Rover
  attr_accessor :x_position, :y_position, :direction

  def initialize(x_position, y_position, direction, plateau)
    @plateau = plateau
    validate_bounds(x_position, y_position)
    @x_position = x_position.to_i
    @y_position = y_position.to_i
    change_direction(direction)
  end

  def change_direction(direction)
    @direction = direction
    @direction.context = self
  end

  def move_forward
    new_coordinates = @direction.move_forward(x_position, y_position)
    validate_bounds(new_coordinates[0], new_coordinates[1])
    @x_position = new_coordinates[0]
    @y_position = new_coordinates[1]
  end

  def turn_left
    @direction.turn_left
  end

  def turn_right
    @direction.turn_right
  end

  def current_position
    "#{x_position} #{y_position} #{direction.name}"
  end

  private

  def validate_bounds(x_position, y_position)
    raise WarningMessage.out_of_bounds if @plateau.out_of_bounds?(x_position.to_i, y_position.to_i)
  end
end
