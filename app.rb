require 'sinatra'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class BattleApp < Sinatra::Base
  enable :sessions

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
    Game.new.attack($player2)
    erb(:attack)
  end
end