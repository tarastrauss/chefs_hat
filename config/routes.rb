Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/index'

  get '/sessions', to: 'sessions#show'

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy, :show]
  resources :hats, only: [:show]


  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'


end
