# frozen_string_literal: true

require "rspec/core/rake_task"
require_relative 'lib/nasa_rovers.rb'

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

task :run do
  NasaRovers.new.run
end