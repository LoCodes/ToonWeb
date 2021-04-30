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

  resources :users
  resources :animes, only: [:index, :new, :create]


  #nested routes should go in one direction PARENT => CHILD
  # we only want index, new, create 
  resources :genres do #PARENT
    resources :animes, only: [:index, :new, :create]  #CHILD. => will creaate 7 nested restful routes 
  end 





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
