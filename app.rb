require 'sinatra'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class BattleApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get "/take_names" do
    erb(:player_input)
  end

  post '/names' do
    player1 = Player.new(params["player1"])
    player2 = Player.new(params["player2"])
    $game = Game.new(player1, player2)
    redirect('/play')
  end

  get '/play' do
    erb(:play)
  end

  get "/attack" do
    $game.attack($game.current_turn)
    erb(:attack)
  end

  get '/next' do
    redirect('/play')
  end
end