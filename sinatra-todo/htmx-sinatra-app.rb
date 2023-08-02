require 'sinatra'
require 'pry'

class Task < Struct.new(:description, :done)
    def initialize(description, done = false)
      super
    end

    def mark_as_done!
      self.done = true
    end

    def done?
      done
    end
end

class Sinatra::Application
  def initialize
    @tasks = []
    @tasks << Task.new("Meet Ken") << Task.new("Practice my hadouken")
    super
  end
end

get '/' do
  erb :tasks, layout: :index
end

get '/diceroll' do
  erb :diceroll
end

post '/tasks' do
  if params['task'].length.positive?
    @clear_form = true
    @tasks << Task.new(params['task'])
  else
    @error = "please enter a task"
  end
    erb :tasks
end

patch '/tasks/:id' do
  @tasks[params[:id].to_i].mark_as_done!
  erb :tasks
end

delete '/tasks/:id' do
  @tasks.delete_at(params[:id].to_i)
  erb :tasks
end
