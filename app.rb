require 'sinatra'
require 'player'

class BattleApp < Sinatra::Base
  enable :sessions
  @player1_hp = 69
  @player2_hp = 69

  get '/' do
    erb(:player_input)
  end

  post '/names' do
    $player1 = Player.new(params["player1"])
    $player2 = Player.new(params["player2"])
    redirect('/play')
  end

  get '/play' do
    erb(:play)
  end

  get "/attack" do
    erb(:attack)
  end
end