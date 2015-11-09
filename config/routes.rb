Rails.application.routes.draw do


  root 'welcome#index'


  get 'welcome/index'

  get '/sessions', to: 'sessions#show'

  resources :users, only: [:new, :create, :show, :destroy, :update, :edit]
  resources :sessions, only: [:new, :create, :destroy, :show]
  resources :hats, only: [:new, :create, :show, :destroy]
  resources :memberships, only: [:create, :destroy]
  resources :comments, only: [:new, :create, :destroy, :show]
  resources :recipes, only: [:new, :create, :destroy, :show, :update, :edit]

  get '/hats/recipe', to: 'hats#recipe'

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  post '/users/search', to: 'users#search', as: 'users_search'
  post 'memberships/unfollow', to: 'memberships#unfollow', as: 'memberships_unfollow'


  if @current_user
    root 'user#show'
  end

end
