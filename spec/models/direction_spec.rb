require "spec_helper"
require "models/direction"

RSpec.describe Direction do
  subject(:direction) { described_class.new }

  describe "#turn_left" do
    it "changes context to east direction" do
      expect { direction.turn_left }.to raise_error NotImplementedError
    end
  end

  describe "#turn_right" do
    it "changes context to west direction" do
      expect { direction.turn_right }.to raise_error NotImplementedError
    end
  end
end
