require 'sinatra'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class BattleApp < Sinatra::Base
  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  get "/take_names" do
    erb(:player_input)
  end

  post '/names' do
    player1 = Player.new(params["player1"])
    player2 = Player.new(params["player2"])
    Game.start_game(player1, player2)
    redirect('/play')
  end

  get '/play' do
    erb(:play)
  end

  get "/attack" do
    @game.attack(@game.current_turn)
    erb(:attack)
  end

  get '/next' do
    redirect('/play') if @game.winner.nil?
    redirect('/winner')
  end

  get '/winner' do
    erb(:winner)
  end
end