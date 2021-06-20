class South < Direction
  def turn_left
    @context.change_direction(East.new)
  end

  def turn_right
    @context.change_direction(West.new)
  end
end
