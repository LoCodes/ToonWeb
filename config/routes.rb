Rails.application.routes.draw do
  # get 'animes/index'
  # get 'animes/new'
  # get 'animes/edit'
  # get 'animes/show'

  root to: 'application#welcome'

  get '/signup', to: 'users#new'#, as: signup. --users/signup dont work 
  post '/signup', to: 'users#create'

  #login route 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  #logout route 
  get '/logout' => 'sessions#destroy'

  resources :genres
  resources :animes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
