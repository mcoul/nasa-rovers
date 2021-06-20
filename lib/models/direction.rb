class Direction
  attr_accessor :context

  def turn_left
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def turn_right
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
