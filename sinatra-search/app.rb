# frozen_string_literal: true

require 'sinatra'
require 'pry'
require 'yaml'

class Sinatra::Application
  def initialize
    @users = 
      YAML.load_file('db/users.yaml')['results']
      .map do |u|
        {
          name: "#{u['name']['first']} #{u['name']['last']}",
          email: u['email'],
          avatar_url: u['picture']['medium']
        }
      end.sort_by { _1[:name] }

      super
    end
  end
end

def find_by(name)
  @users.select { |u| u[:name] =~ /#{name}/i }
end

set :port, 4569

get '/' do
  erb :search, layout: :app
end

post '/q' do
  @selected_users = params['q'] ? find_by(params['q']) : []
  erb :_results
end
