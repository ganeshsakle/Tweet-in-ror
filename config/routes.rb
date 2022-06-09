Rails.application.routes.draw do
  root 'main#index'
  #root 'abouts#index'
  get "abouts" => 'abouts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
