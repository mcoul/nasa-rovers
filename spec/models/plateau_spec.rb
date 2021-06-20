require 'spec_helper'
require 'models/plateau'

RSpec.describe Plateau do
  subject(:plateau) { described_class.new(5, 5) }
end