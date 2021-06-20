require "spec_helper"
require_all "lib/models"

RSpec.describe South do
  subject(:context) { Rover.new(3, 5, south) }

  let(:south) { described_class.new }

  describe "#turn_left" do
    it "changes context to east direction" do
      context.turn_left
      expect(context.direction.class.name).to eq "East"
    end
  end

  describe "#turn_right" do
    it "changes context to west direction" do
      context.turn_right
      expect(context.direction.class.name).to eq "West"
    end
  end
end
