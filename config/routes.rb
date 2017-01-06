Rails.application.routes.draw do

  root to: 'static#index'

  get '/signin', to: 'sessions#new', as: 'signin'

  post '/sessions', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/attractions', to: 'attractions#index', as: 'attractions'

  post '/users/:id', to: 'users#show'

  resources :attractions

  resources :rides

  resources :users

end
