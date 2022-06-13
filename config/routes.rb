Rails.application.routes.draw do
  resources :users
  root 'main#index'
  #root 'abouts#index'
  get "/about", to: "about#index"
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
