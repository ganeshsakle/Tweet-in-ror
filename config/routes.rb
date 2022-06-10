Rails.application.routes.draw do
  root 'main#index'
  #root 'abouts#index'
  get "/about", to: "about#index"
  get '/signup', to: 'sign_up#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
