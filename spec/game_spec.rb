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
    it "removes health from the player not inputted" do
      expect(player2).to receive(:health=)
      test_game.attack(player1)
    end
  end
  describe "#current_turn" do
    it "initiates as player 1" do
      expect(test_game.current_turn).to eq(player1)
    end

    it "goes to player 2 after an attack" do
      allow(player2).to receive(:health=)
      test_game.attack(player1)
      expect(test_game.current_turn).to eq(player2)
    end
  end

  describe "#winner?" do
    it "returns nil if players both have positive HP" do
      expect(test_game.winner).to eq(nil)
    end

    it "declares that someone has one when hp is <= 0" do
      soon_to_be_dead_player = double :player, health: -5
      alive_player = double :player, health: 69
      game_thats_over = Game.new(soon_to_be_dead_player, alive_player)
      allow(soon_to_be_dead_player).to receive(:health=)
      game_thats_over.attack(alive_player)
      expect(game_thats_over.winner).to eq(alive_player)
    end
  end
end