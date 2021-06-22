class DeployRoverParser
  class << self
    def execute(input, plateau)
      x_position = input.split[0]
      y_position = input.split[1]
      direction = directions[input.scan(/\w/).last.upcase]
      raise WarningMessage.deploy_rover unless direction

      Rover.new(x_position, y_position, direction, plateau)
    end

    private

    def directions
      {
        "N" => North.new,
        "E" => East.new,
        "W" => West.new,
        "S" => South.new
      }
    end
  end
end
