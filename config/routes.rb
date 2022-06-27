Rails.application.routes.draw do
  resources :users
  root to: 'users#index'
  get  '/signup', to: 'users#new'
  get  '/login',  to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout' , to:'sessions#destroy'
  get '/otpform', to: 'users#otpform'
  post '/otpform',  to: 'users#otpverifier'
  resources :users
  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
