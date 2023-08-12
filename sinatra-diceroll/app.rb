require 'sinatra'
require 'pry'

class Sinatra::Application
  def initialize
    @game = Game.new
    @p1 = @game.player_one
    @p2 = @game.player_two
    @dice = rand(1..6)

    super
  end
end

set :port, 4568

get '/new' do
  @game.reset_game
  redirect '/'   
end

post '/roll' do
  @dice = rand(1..6)
  if @dice == 1
    @game.rolled_so_far = 0
    @game.switch_players
  else
    @game.rolled_so_far += @dice
  end
  @rolled_so_far = @game.rolled_so_far  
  @active_player = @game.active_player

  erb :rolled
end

post '/hold' do
  @game.active_player.score += @game.rolled_so_far
  @game.switch_players
  @game.reset_rolled_so_far

  erb :hold
end

get '/' do
  erb :index
end

class Game
  Player = Struct.new(:id, :score)
  attr_accessor :player_one, :player_two, :rolled_so_far, :active_player 

  def initialize
    @player_one = Player.new(id: 1, score: 0)
    @player_two = Player.new(id: 2, score: 0)
    @active_player = [@player_one, @player_two].sample
    reset_rolled_so_far
  end

  def reset_rolled_so_far
    @rolled_so_far = 0
  end

  def reset_game
    @player_one.score = 0
    @player_two.score = 0
    @active_player = [@player_one, @player_two].sample
    reset_rolled_so_far
  end

  def switch_players
    @active_player = 
      case @active_player
      when @player_one then @player_two
      when @player_two then @player_one
      end
  end
end
