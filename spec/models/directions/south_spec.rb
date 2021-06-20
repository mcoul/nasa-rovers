RSpec.describe South do
  subject(:context) { Rover.new(x_position, y_position, south, plateau) }

  let(:south) { described_class.new }
  let(:x_position) { 3 }
  let(:y_position) { 4 }
  let(:plateau) { Plateau.new(5, 5) }

  describe "#move_forward" do
    it "does not change the x position" do
      expect(south.move_forward(x_position, y_position).first).to eq(x_position)
    end

    it "decrements the y position" do
      expect(south.move_forward(x_position, y_position).last).to eq(y_position - 1)
    end
  end

  describe "#turn_left" do
    it "changes context's direction to east" do
      context.turn_left
      expect(context.direction.class.name).to eq "East"
    end
  end

  describe "#turn_right" do
    it "changes context's direction to west" do
      context.turn_right
      expect(context.direction.class.name).to eq "West"
    end
  end
end
