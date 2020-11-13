class Game
  attr_accessor :player1, :player2
  attr_reader :current_turn
  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @current_turn = @player1
  end

  def attack(player)
    opponent_of(player).health -= 10
    change_turn
  end

  private

  def opponent_of(player)
    player == @player1 ? @player2 : @player1
  end

  def change_turn
    if @current_turn == @player1
      @current_turn = @player2
    else
      @current_turn = @player1
    end
  end
end