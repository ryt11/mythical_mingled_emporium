Rails.application.routes.draw do


  resources :creatures, only: [:index, :show]

  #below: last path
  get '/:category', to: "categories#show", as: "category"
end

