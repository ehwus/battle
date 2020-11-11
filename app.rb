require 'sinatra'

class BattleApp < Sinatra::Base
  enable :sessions
  @player1_hp = 69
  @player2_hp = 69

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

  get "/attack" do
    @player1_name = session[:player1_name]
    @player2_name = session[:player2_name]
    erb(:attack)
  end
end