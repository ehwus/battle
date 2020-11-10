require 'sinatra'

class BattleApp < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:player_input)
  end

  post '/names' do
    session[:player1_name] = params["player1"]
    session[:player2_name] = params["player2"]
    redirect('/play')
  end

  get '/play' do
    erb(:play)
  end
end