Rails.application.routes.draw do
  get '/', to: 'top#index'
  resources :borroweds
  post "/borroweds/confirm"
  post "/borroweds/new"
  resources :rentals
  get 'sessions/new'
  get 'users/index'
  resources:users

  #ログイン用
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
end
