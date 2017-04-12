Rails.application.routes.draw do
  root to: 'creatures#index'

  resources :creatures, only: [:index, :show]
  # resources :carts, only: [:index, :create, :update]
  resource :cart, only: [:show, :create, :update, :destroy]

  # put '/cart_creature', to: "carts#update", as: "update_cart"
  # delete '/cart_creature', to: "carts#destroy", as: "delete_cart_item"

  get '/:category', to: "categories#show", as: "category"
end
