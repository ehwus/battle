require 'game'

describe Game do
  let(:player) { double :player, health: 69 }
  describe "#attack" do
    it "removes health from the player inputted" do
      expect(player).to receive(:health=)
      subject.attack(player)
    end
  end
end