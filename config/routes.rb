Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  root 'users#home' #home

  resources :users

  get '/signup', to: "users#new"
  post '/signup', to: "users#create"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  get '/auth/github/callback' => 'sessions#create' #must be name of provider
  get '/auth/failure', to: redirect('/')
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:show] do #nested resource, parent: user => many reviews
    resources :reviews, only: [:index, :show, :new, :edit] #child: review LiMIT user to see ONLY another user's review(s)
  end

  resources :reviews #current user can CRUD

  resources :restaurants, except: [:new, :create, :edit, :update, :destroy]

  resources :restaurants, only: [:show, :index] do
    resources :reviews, only: [:show, :index]
  end

  #testing friendly_id gem
  #get "/users/:email", :to => "users#show", :constraints => { :email => /.+@.+\..*/ } 

end
