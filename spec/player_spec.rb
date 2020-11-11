require 'player'

describe Player do
  describe "#name" do
    it "returns its own name correctly" do
      test = Player.new("Alex")
      expect(test.name).to eq("Alex")
    end
  end
end