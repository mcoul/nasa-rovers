require "spec_helper"
require_all "lib/models"

RSpec.describe East do
  subject(:context) { Rover.new(x_position, y_position, east) }

  let(:east) { described_class.new }
  let(:x_position) { 3 }
  let(:y_position) { 5 }

  describe "#move_forward" do
    it "does not change the y position" do
      expect(east.move_forward(x_position, y_position).last).to eq(y_position)
    end

    it "increments the x position" do
      expect(east.move_forward(x_position, y_position).first).to eq(x_position + 1)
    end
  end

  describe "#turn_left" do
    it "changes context's direction to north" do
      context.turn_left
      expect(context.direction.class.name).to eq "North"
    end
  end

  describe "#turn_right" do
    it "changes context's direction to south" do
      context.turn_right
      expect(context.direction.class.name).to eq "South"
    end
  end
end
