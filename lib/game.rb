class Game
  attr_accessor :player1, :player2
  attr_reader :current_turn, :winner
  
  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @current_turn = @player1
    @winner = nil
  end

  def self.start_game(p1, p2)
    @game = Game.new(p1, p2)
  end

  def self.instance
    @game
  end

  def attack(player)
    opponent_of(player).health -= 10
    check_for_winner
    change_turn
  end

  def opponent_of(player)
    player == @player1 ? @player2 : @player1
  end

  private

  def change_turn
    if @current_turn == @player1
      @current_turn = @player2
    else
      @current_turn = @player1
    end
  end

  def check_for_winner
    @winner = @player1 if @player2.health <= 0
    @winner = @player2 if @player1.health <= 0
  end
end