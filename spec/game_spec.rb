require 'game'

describe Game do
  let(:player1) { double :player, health: 69 }
  let(:player2) { double :player, health: 69 }
  let(:test_game) { Game.new(player1, player2) }

  it "iniializes with two players" do
    test = Game.new(player1, player2)
    expect(test).to be_instance_of(Game)
  end
  describe "#attack" do
    it "removes health from the player inputted" do
      expect(player1).to receive(:health=)
      test_game.attack(player1)
    end
  end
  describe "#current_turn" do
    it "initiates as player 1" do
      expect(test_game.current_turn).to eq(player1)
    end

    it "goes to player 2 after an attack" do
      allow(player1).to receive(:health=)
      test_game.attack(player1)
      expect(test_game.current_turn).to eq(player2)
    end
  end

end