Rails.application.routes.draw do
  resources :users
  root 'main#index'
  #root 'abouts#index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
