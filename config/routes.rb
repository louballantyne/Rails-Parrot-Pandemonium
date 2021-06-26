Rails.application.routes.draw do
  get 'sessions/new', to: 'sessions#new'
  post 'sessions/new', to: 'sessions#create'
  get 'sessions/destroy', to: 'sessions#destroy'
  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'
  get 'messages/index', to: 'messages#index'
  get 'messages/new', to: 'messages#new'
  post '/messages/new', to: 'messages#create'
  get '/articles', to: 'articles#index'
  root to: 'articles#index'
end
