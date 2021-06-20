require "spec_helper"
require_all "lib/models"

RSpec.describe East do
  subject(:context) { Rover.new(3, 5, east) }

  let(:east) { described_class.new }

  describe "#turn_left" do
    it "changes context to north direction" do
      context.turn_left
      expect(context.direction.class.name).to eq "North"
    end
  end

  describe "#turn_right" do
    it "changes context to south direction" do
      context.turn_right
      expect(context.direction.class.name).to eq "South"
    end
  end
end
