RSpec.describe Plateau do
  subject(:plateau) { described_class.new(5, 5) }

  describe "#out_of_bounds" do
    let(:x_coordinate) { 3 }
    let(:y_coordinate) { 4 }

    context "when it is correct" do
      it "should be false" do
        expect(plateau.out_of_bounds?(x_coordinate, y_coordinate)).to be false
      end
    end

    context "when x is greater than the maximum x" do
      let(:x_coordinate) { 5 }
      it "should be true" do
        expect(plateau.out_of_bounds?(x_coordinate, y_coordinate)).to be true
      end
    end

    context "when y is greater than the maximum y" do
      let(:y_coordinate) { 5 }
      it "should be true" do
        expect(plateau.out_of_bounds?(x_coordinate, y_coordinate)).to be true
      end
    end

    context "when x is negative" do
      let(:x_coordinate) { -1 }
      it "should be true" do
        expect(plateau.out_of_bounds?(x_coordinate, y_coordinate)).to be true
      end
    end

    context "when y is negative" do
      let(:y_coordinate) { -1 }
      it "should be true" do
        expect(plateau.out_of_bounds?(x_coordinate, y_coordinate)).to be true
      end
    end

    context "when both coordinates are greater than the maximum values" do
      let(:x_coordinate) { 6 }
      let(:y_coordinate) { 6 }
      it "should be true" do
        expect(plateau.out_of_bounds?(x_coordinate, y_coordinate)).to be true
      end
    end

    context "when both coordinates are negative values" do
      let(:x_coordinate) { -2 }
      let(:y_coordinate) { -2 }
      it "should be true" do
        expect(plateau.out_of_bounds?(x_coordinate, y_coordinate)).to be true
      end
    end
  end
end
