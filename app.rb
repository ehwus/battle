require 'sinatra'

class BattleApp < Sinatra::Base
  get '/' do
    'Hello Battle!'
  end
end