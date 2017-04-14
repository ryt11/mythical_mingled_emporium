Rails.application.routes.draw do
  get 'users/new'

  get 'sessions/new'

  root to: 'application#landing'

  resources :creatures, only: [:index, :show]
  resources :categories, only: [:index]
  resources :orders, only: [:index, :show, :create]
  resource :cart, only: [:show, :create, :update, :destroy]
  resources :users, only: [:new, :create]

  get '/dashboard', to: 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/:category', to: 'categories#show', as: 'category'
end
