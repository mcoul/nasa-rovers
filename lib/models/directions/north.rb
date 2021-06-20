class North < Direction
  def move_forward(x_position, y_position)
    [x_position, y_position + 1]
  end

  def turn_left
    @context.change_direction(West.new)
  end

  def turn_right
    @context.change_direction(East.new)
  end
end
