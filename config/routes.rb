require "sidekiq/web"
Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web => '/sidekiq'

  root to: 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :homes, only: [:index, :show]
  resources :file_ceaps, only: [:index, :new, :create]
end
