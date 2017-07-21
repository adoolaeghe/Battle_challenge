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
    if $game.finish_player_1
      erb :loose_player_1
    elsif  $game.finish_player_2
      erb :loose_player_2
    else
      erb :play
    end
  end

  post '/attack_player_2' do
    $game.attack if $game.current_victim == $game.player_2
    redirect '/play'
  end

  post '/attack_player_1' do
    $game.attack if $game.current_victim == $game.player_1
    redirect '/play'
  end

  post '/big_attack_player_1' do
    $game.big_attack if $game.current_victim == $game.player_1
    redirect '/play'
  end

  post '/big_attack_player_2' do
    $game.big_attack if $game.current_victim == $game.player_2
    redirect '/play'
  end

  run! if app_file == $0
end
