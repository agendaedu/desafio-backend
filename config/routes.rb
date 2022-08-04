Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :file_ceaps, only: [:index, :new, :create]
end
