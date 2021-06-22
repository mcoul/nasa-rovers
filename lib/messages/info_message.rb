module InfoMessage
  class << self
    def greeting_instructions
      "Welcome to Nasa Rovers!\n\n"\
        "Please, enter the following input in separate lines:\n\n"\
        "1) Plateau's maximum x and y coordinates     [e.g.: '5 5']\n"\
        "2) Rover's deployment position               [e.g.: '1 3 N']\n"\
        "3) Movement instructions for the rover       [e.g.: 'M R L M L']\n\n"\
        "The available movements for a rover are 'M', 'L' & 'R', which\n"\
        "correspond to moving forward, turning left and turning right.\n\n"\
        "Note: you can add as many rovers as you wish; the only condition\n"\
        "is to insert both lines 2) and 3) for each rover you include.\n\n"\
        "Once you are finished, type ctrl-d to see the output.\n\n"\
        "Have fun!\n\n"\
        "You may start typing here:\n".freeze
    end

    def output
      "\n\nOUTPUT:\n".freeze
    end

    def repeat_line
      "Please, type this line again:".freeze
    end
  end
end
