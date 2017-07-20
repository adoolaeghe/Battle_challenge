require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_1_name]),Player.new(params[:player_2_name]))
    redirect '/play'
  end

  get '/play' do
    last_move = session[:last_move]
    attack_confirmation = ''
    if last_move == 'Attack'
      attack_confirmation = "#{$game.player_1.name} has attacked #{$game.player_2.name}"
    end
    erb :play, { locals: { attack_confirmation: attack_confirmation } }
  end

  post '/attacked' do
    session[:last_move] = params[:attack]
    $game.attack($game.player_2)
    redirect '/play'
  end

  run! if app_file == $0
end
