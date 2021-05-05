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
  post '/logout' => 'sessions#destroy'

  resources :animes

  #'/users/:id/animes'
  #'/users/:id/animes/new'
  resources :users do 
    resources :animes, only: [:index, :new, :create] #i only wanna do nested for index, CHANGE LATER?
  end 

  #nested routes should go in one direction PARENT => CHILD
  # we only want index, new, create 

  #'/genres/:id/animes'
  #'/genres/:id/animes/new'
  resources :genres do #PARENT
    resources :animes, only: [:index, :new, :create]  #CHILD. => will creaate 7 nested restful routes 
  end 

  #@anime.genre


  get '/auth/:provider/callback', to: 'sessions#omniauth'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
