RSpec.describe Direction do
  subject(:direction) { described_class.new }
  let(:x_position) { 3 }
  let(:y_position) { 4 }

  describe "#move_forward" do
    it "raises a 'method not implemented' error" do
      expect { direction.move_forward(x_position, y_position) }.to raise_error NotImplementedError
    end
  end

  describe "#turn_left" do
    it "raises a 'method not implemented' error" do
      expect { direction.turn_left }.to raise_error NotImplementedError
    end
  end

  describe "#turn_right" do
    it "raises a 'method not implemented' error" do
      expect { direction.turn_right }.to raise_error NotImplementedError
    end
  end
end
