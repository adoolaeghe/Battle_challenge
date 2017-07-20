require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    $game = Game.new
    redirect '/play'
  end

  get '/play' do
    $player_1_hp, $player_2_hp = $player_1.hp, $player_2.hp
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    last_move = session[:last_move]
    attack_confirmation = ''
    if last_move == 'Attack'
      attack_confirmation = "#{@player_1_name} has attacked #{@player_2_name}"
    end
    erb :play, { locals: { attack_confirmation: attack_confirmation } }
  end

  post '/attacked' do
    session[:last_move] = params[:attack]
    $game.attack($player_2)
    redirect '/play'
  end

  run! if app_file == $0
end
