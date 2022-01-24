Rails.application.routes.draw do
  resources :cars, only: %i[index]
  get '/help', to: 'static_pages#help'
  root 'static_pages#home'
end
