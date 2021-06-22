require "require_all"
require_all "lib"

class NasaRovers
  def initialize
    @rovers = []
  end

  def verbose_run
    display_initial_greeting
    run
  end

  def run
    create_plateau
    until $stdin.eof
      deploy_rover
      move_rover
    end

    display_output_message
    rovers.each do |rover|
      puts rover.current_position
    end
  end

  private

  attr_accessor :plateau, :rovers

  def create_plateau
    @plateau = CreatePlateauParser.execute($stdin.gets.chomp)
  rescue StandardError => e
    handle_error(e, method(:create_plateau))
  end

  def deploy_rover
    rovers << DeployRoverParser.execute($stdin.gets.chomp, plateau)
  rescue StandardError => e
    handle_error(e, method(:deploy_rover))
  end

  def move_rover
    MoveRoverParser.execute($stdin.gets.chomp, rovers.last)
  rescue StandardError => e
    handle_error(e, method(:move_rover))
  end

  def handle_error(error, repeat_action)
    puts error
    puts InfoMessage.repeat_line
    repeat_action.call
  end

  def display_initial_greeting
    puts InfoMessage.greeting_instructions
  end

  def display_output_message
    puts InfoMessage.output
  end
end
