Rails.application.routes.draw do
  root to: 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :homes
  resources :file_ceaps, only: [:index, :new, :create]
end
