require 'sinatra'
require 'pry'

class Sinatra::Application
  def initialize
    @game = Game.new
    @p1 = @game.player_one
    @p2 = @game.player_two
    @dice = rand(1..6).to_s
    @active_player = [@p1, @p2].sample

    super
  end
end

set :port, 4568

post '/roll' do
  @dice = rand(1..6)
  @game.rolled_so_far += @dice
  @rolled_so_far = @game.rolled_so_far  

  erb :rolled
end

post '/hold' do
  # TODO: below is incorrect and just a draft
  # @active_player.score += @rolled_so_far
  # reset_rolled_so_far
end

get '/' do
  erb :index
end

class Game
  Player = Struct.new(:id, :score)
  attr_accessor :player_one, :player_two, :rolled_so_far

  def initialize
    @player_one = Player.new(id: 1, score: 0)
    @player_two = Player.new(id: 2, score: 0)
    reset_rolled_so_far
  end

  def reset_rolled_so_far
    @rolled_so_far = 0
  end
end
