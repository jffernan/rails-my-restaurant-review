Rails.application.routes.draw do

  root 'users#home'

  resources :users

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

end
