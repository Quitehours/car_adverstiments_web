Rails.application.routes.draw do
  resources :cars, only: %i[index]
end
