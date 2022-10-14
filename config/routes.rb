Rails.application.routes.draw do
  resources :spread_sheet_uploads, only: %i[create]
end
