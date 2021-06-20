require "spec_helper"

RSpec.describe Rover do
  subject(:rover) { described_class.new(1, 3, direction, plateau) }

  let(:plateau) { Plateau.new(5, 5) }

  describe "#move_forward" do
    context "when it is facing north" do
      let(:direction) { North.new }
      it "does not change the x position" do
        expect{ rover.move_forward }.not_to change{ rover.x_position }
      end

      it "increments the y position" do
        expect{ rover.move_forward }.to change{ rover.y_position }.by(1)
      end
    end

    context "when it is facing west" do
      let(:direction) { West.new }
      it "does not change the y position" do
        expect{ rover.move_forward }.not_to change{ rover.y_position }
      end

      it "decrements the x position" do
        expect{ rover.move_forward }.to change{ rover.x_position }.by(-1)
      end
    end

    context "when it is facing south" do
      let(:direction) { South.new }
      it "does not change the x position" do
        expect{ rover.move_forward }.not_to change{ rover.x_position }
      end

      it "decrements the y position" do
        expect{ rover.move_forward }.to change{ rover.y_position }.by(-1)
      end
    end

    context "when it is facing east" do
      let(:direction) { East.new }
      it "does not change the y position" do
        expect{ rover.move_forward }.not_to change{ rover.y_position }
      end

      it "increments the x position" do
        expect{ rover.move_forward }.to change{ rover.x_position }.by(1)
      end
    end
  end

  describe "#turn_left" do
    context "when it is facing north" do
      let(:direction) { North.new }
      it "changes its direction to west" do
        rover.turn_left
        expect(rover.direction.class.name).to eq "West"
      end
    end

    context "when it is facing west" do
      let(:direction) { West.new }
      it "changes its direction to south" do
        rover.turn_left
        expect(rover.direction.class.name).to eq "South"
      end
    end

    context "when it is facing south" do
      let(:direction) { South.new }
      it "changes its direction to east" do
        rover.turn_left
        expect(rover.direction.class.name).to eq "East"
      end
    end

    context "when it is facing east" do
      let(:direction) { East.new }
      it "changes its direction to north" do
        rover.turn_left
        expect(rover.direction.class.name).to eq "North"
      end
    end
  end

  describe "#turn_right" do
    context "when it is facing north" do
      let(:direction) { North.new }
      it "changes its direction to east" do
        rover.turn_right
        expect(rover.direction.class.name).to eq "East"
      end
    end

    context "when it is facing west" do
      let(:direction) { West.new }
      it "changes its direction to north" do
        rover.turn_right
        expect(rover.direction.class.name).to eq "North"
      end
    end

    context "when it is facing south" do
      let(:direction) { South.new }
      it "changes its direction to west" do
        rover.turn_right
        expect(rover.direction.class.name).to eq "West"
      end
    end

    context "when it is facing east" do
      let(:direction) { East.new }
      it "changes its direction to south" do
        rover.turn_right
        expect(rover.direction.class.name).to eq "South"
      end
    end
  end
end
