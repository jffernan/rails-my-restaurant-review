Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  root 'users#index'
  resources :users
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

end
