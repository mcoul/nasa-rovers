module WarningMessage
  class << self
    def create_plateau
      "\n***** WARNING *****\n\n"\
      "Invalid plateau boundaries: you must enter exactly 2\n"\
      "positive integers, corresponding to the maximum x & y\n"\
      "coordinates, separated by a space.\n\n".freeze
    end

    def deploy_rover
      "\n***** WARNING *****\n\n"\
      "Invalid cardinal point entered. Valid points are:\n\n"\
      "- N: North\n"\
      "- E: East\n"\
      "- W: West\n"\
      "- S: South\n\n".freeze
    end

    def move_rover
      "\n***** WARNING *****\n\n"\
      "Invalid moving command entered. Valid commands are:\n\n"\
      "- M: move forward\n"\
      "- L: turn left\n"\
      "- R: turn right\n\n".freeze
    end

    def out_of_bounds
      "\n***** WARNING *****\n\n"\
      "Out of bounds: make sure the rover stays within the\n"\
      "plateau's maximum/minimum x & y coordinates.\n\n".freeze
    end
  end
end
