require 'sinatra'

class BattleApp < Sinatra::Base
  get '/' do
    erb(:player_input)
  end

  post '/names' do
    @player1 = params["player1"]
    @player2 = params["player2"]
    erb(:names)
  end
end