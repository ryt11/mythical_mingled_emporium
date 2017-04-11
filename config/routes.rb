Rails.application.routes.draw do
  root to: 'creatures#index'

  resources :creatures, only: [:index, :show]
  resources :carts, only: [:index, :create]

  get '/:category', to: "categories#show", as: "category"
end
