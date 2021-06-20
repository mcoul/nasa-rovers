class East < Direction
  def turn_left
    @context.change_direction(North.new)
  end

  def turn_right
    @context.change_direction(South.new)
  end
end
