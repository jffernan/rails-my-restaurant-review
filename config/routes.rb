Rails.application.routes.draw do

  root 'users#index'
  resources :users
  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

end
