Rails.application.routes.draw do
  get 'replies/create'
  get 'replies/destroy'
  get 'sessions/new', to: 'sessions#new'
  post 'sessions/new', to: 'sessions#create'
  get 'sessions/destroy', to: 'sessions#destroy'
  get '/users/new', to: 'users#new'
  post '/users/new', to: 'users#create'
  get '/users/edit', to: 'users#edit'
  
  get 'messages/index', to: 'messages#index'
  get 'messages/new', to: 'messages#new'
  post '/messages/new', to: 'messages#create'
  get '/messages/:id', to: 'messages#show'
  get '/articles', to: 'articles#index'
  root to: 'articles#index'
  resources :messages, only: [:show] do
    resources :replies
  end
end
