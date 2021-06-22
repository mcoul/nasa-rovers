class MoveRoverParser
  class << self
    def execute(input, rover)
      initial_rover = rover.clone
      raise WarningMessage.move_rover if input.strip.empty?

      input.scan(/\w/).each do |key|
        raise WarningMessage.move_rover unless moves[key]

        begin
          moves[key].execute(rover)
        rescue StandardError
          reset_rover(rover, initial_rover)
          raise
        end
      end
    end

    private

    def moves
      {
        "M" => MoveForwardCommand,
        "L" => TurnLeftCommand,
        "R" => TurnRightCommand
      }
    end

    def reset_rover(rover, initial_rover)
      rover.x_position = initial_rover.x_position
      rover.y_position = initial_rover.y_position
      rover.direction = initial_rover.direction
    end
  end
end
