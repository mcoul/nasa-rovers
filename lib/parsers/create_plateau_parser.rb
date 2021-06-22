class CreatePlateauParser
  class << self
    def execute(input)
      raise WarningMessage.create_plateau if invalid?(input.split)

      Plateau.new(input.split[0], input.split[1])
    end

    private

    def invalid?(input)
      input.size != 2 || !/\A\d+\z/.match(input[0]) || !/\A\d+\z/.match(input[1])
    end
  end
end
