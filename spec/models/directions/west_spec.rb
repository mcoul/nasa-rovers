require "spec_helper"
require_all "lib/models"

RSpec.describe West do
  subject(:context) { Rover.new(x_position, y_position, west) }

  let(:west) { described_class.new }
  let(:x_position) { 3 }
  let(:y_position) { 5 }

  describe "#move_forward" do
    it "does not change the y position" do
      expect(west.move_forward(x_position, y_position).last).to eq(y_position)
    end

    it "decrements the x position" do
      expect(west.move_forward(x_position, y_position).first).to eq(x_position - 1)
    end
  end

  describe "#turn_left" do
    it "changes context's direction to south" do
      context.turn_left
      expect(context.direction.class.name).to eq "South"
    end
  end

  describe "#turn_right" do
    it "changes context's direction to north" do
      context.turn_right
      expect(context.direction.class.name).to eq "North"
    end
  end
end
