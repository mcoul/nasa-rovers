require "rspec/core/rake_task"
require_relative "app"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

task :run do
  NasaRovers.new.run
end

task :friendly_run do
  NasaRovers.new.verbose_run
end
