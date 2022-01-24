Rails.application.routes.draw do
  resources :cars, only: %i[index]
  resources :searches, only: %i[index new create]

  get '/help', to: 'static_pages#help'
  root 'static_pages#menu'
end
