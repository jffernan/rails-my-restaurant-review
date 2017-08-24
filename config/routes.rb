Rails.application.routes.draw do

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

  resources :restaurants, only: [:show] do
    resources :reviews, only: [:index, :show]
  end
<<<<<<< HEAD

  get '/reviews/top_reviews', to: 'reviews#excellent_reviews', as: :top_reviews
=======
  
  get '/reviews/top_reviews', to: 'reviews#top_reviews', as: :top_reviews
>>>>>>> 78af98e4893f687c8797bc5532f69ecec4cc685d

end
