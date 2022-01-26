Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :searches, only: %i[index]
  end

  resources :searches, only: %i[new create]

  resources :cars, only: %i[index]

  get '/help', to: 'static_pages#help'
  root 'static_pages#home'
end
