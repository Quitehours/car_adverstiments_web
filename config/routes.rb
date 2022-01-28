Rails.application.routes.draw do
  devise_for :users, excepted: %i[registrations#edit]

  resources :searches, only: %i[index new create]
  resources :cars, only: %i[index]

  get '/help', to: 'static_pages#help'
  root 'static_pages#home'
end
