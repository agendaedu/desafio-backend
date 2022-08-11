require "sidekiq/web"
Rails.application.routes.draw do
  devise_for :users
  resources :congressmen, only: %i(index show destroy)
  resources :uploads, only: %i(index new create destroy)
  root "congressmen#index"
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
