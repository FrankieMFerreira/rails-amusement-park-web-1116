Rails.application.routes.draw do

  root to: 'static#index'

  get '/signin', to: 'sessions#new', as: 'signin'
  
  post '/sessions', to: 'sessions#create'

  resources :attractions

  resources :rides

  resources :users

end
