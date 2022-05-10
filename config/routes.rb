Rails.application.routes.draw do
  resources :stocks, except: %i[edit show]
end
