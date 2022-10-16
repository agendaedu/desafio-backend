Rails.application.routes.draw do
  resources :spread_sheet_uploads, only: %i[create]
  resources :deputies, only: %i[index]
end
