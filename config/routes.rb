Rails.application.routes.draw do
  devise_for :users
  resources :congressmen, only: %i(index show)
  resources :uploads, only: %i(index new create destroy)
  root "congressmen#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
