require 'sinatra'

set :port, 4568

get '/' do
  erb :index
end

