class East < Direction
  def move_forward(x_position, y_position)
    [x_position + 1, y_position]
  end

  def turn_left
    @context.change_direction(North.new)
  end

  def turn_right
    @context.change_direction(South.new)
  end

  def name
    "E".freeze
  end
end
