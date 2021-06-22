class DeployRoverParser
  class << self
    def execute(input, plateau)
      raise WarningMessage.deploy_rover if invalid?(input.split)
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

    def invalid?(input)
      input.size != 3 || !/\A\d+\z/.match(input[0]) || !/\A\d+\z/.match(input[1])
    end
  end
end
