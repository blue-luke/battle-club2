require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # our routes would go here

  get '/' do
    erb :index
  end

  post '/play' do
    player1 = Player.new(params[:player1])
    player2 = Player.new(params[:player2])
    $game = Game.new(player1, player2)

    redirect '/play'
  end

  post '/attack' do
    $game.attack
    if $game.winner
      redirect '/winner'
    else
      redirect '/play'
    end
  end

  post '/sleep' do
    $game.put_to_sleep
    redirect '/play'
  end

  post '/defend' do
    $game.defend
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/winner' do
    @game = $game
    erb :winner
  end

  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end