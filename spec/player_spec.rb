require 'player'

describe Player do
  describe "#name" do
    it "returns its own name correctly" do
      test = Player.new("Alex")
      expect(test.name).to eq("Alex")
    end
  end

  describe "#attack" do
    it "attacks another player" do
      player1 = Player.new("Adam")
      player2 = Player.new("Alex")
      
      expect{ player2.attack(player1) }.to change{ player1.health }.by(-10)
    end
  end
end