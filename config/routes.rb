Rails.application.routes.draw do
  root to: 'creatures#index'

  resources :creatures, only: [:index, :show]
  resources :carts, only: [:index, :create]
  delete '/cart_creature', to: "carts#destroy", as: "cart_creature"

  get '/:category', to: "categories#show", as: "category"
end
