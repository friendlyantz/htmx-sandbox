Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #
  # htmx Progress Bar
  get '/progress_bar', to: 'progress_bar#index'
  post '/progress_bar/start', to: 'progress_bar#start'
  get '/progress_bar/job', to: 'progress_bar#job'

  # Defines the root path route ("/")
  root "progress_bar#index"
end
