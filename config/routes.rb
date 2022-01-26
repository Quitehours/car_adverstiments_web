Rails.application.routes.draw do
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  devise_for :users

  resources :cars, only: %i[index]
  resources :searches, only: %i[index new create]

  get '/help', to: 'static_pages#help'
  root 'static_pages#home'
end
