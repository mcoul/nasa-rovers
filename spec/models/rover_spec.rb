require 'spec_helper'
require 'models/rover'

RSpec.describe Rover do
  subject(:rover) { described_class.new(1, 3, 'N') }
end