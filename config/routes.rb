Rails.application.routes.draw do
  get 'events/new'
  get 'events/index'
  get 'events/show'

  get '/logout', to: 'sessions#destroy'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/attendances', to: 'attendances#new'
  post '/attendances', to: 'attendances#create'
  
  resources :users, only: [:new, :create, :show]
  resources :events
  resources :sessions
  resources :attendaces
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'events#index'
end
