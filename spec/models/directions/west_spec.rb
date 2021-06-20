require "spec_helper"
require_all "lib/models"

RSpec.describe West do
  subject(:context) { Rover.new(3, 5, west) }

  let(:west) { described_class.new }

  describe "#turn_left" do
    it "changes context to south direction" do
      context.turn_left
      expect(context.direction.class.name).to eq "South"
    end
  end

  describe "#turn_right" do
    it "changes context to north direction" do
      context.turn_right
      expect(context.direction.class.name).to eq "North"
    end
  end
end
