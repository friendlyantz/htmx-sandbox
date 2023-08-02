require 'sinatra'
require 'pry'

class Sinatra::Application
  def initialize
    game = Game.new
    @p1 = game.player_one
    @p2 = game.player_two
    @dice = rand(1..6).to_s

    super
  end
end

set :port, 4568

post '/roll' do
  binding.pry
  rand(1..6).to_s
end

get '/' do
  erb :index
end

class Game
  Player = Struct.new(:score)
  attr_accessor :player_one, :player_two
  def initialize
    @player_one = Player.new(score: 0)
    @player_two = Player.new(score: 0)
  end
end
