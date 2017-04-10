Rails.application.routes.draw do
  get 'creatures/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :creatures, only: [:index, :show]
end

