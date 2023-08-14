require 'sinatra'
require 'pry'

class Sinatra::Application
  def initialize

    super
  end
end

set :port, 4569

get '/' do
  erb :search, layout: :app
end
