Rails.application.routes.draw do
  # get 'animes/index'
  # get 'animes/new'
  # get 'animes/edit'
  # get 'animes/show'

  root to: 'application#welcome'
  resources :genres
  resources :animes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
