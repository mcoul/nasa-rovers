class Direction
  attr_accessor :context

  def move_forward(x_position, y_position)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def turn_left
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def turn_right
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
