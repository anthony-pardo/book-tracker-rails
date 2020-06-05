Rails.application.routes.draw do
  resources :genres
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
    
  resources :users do
    resources :genres
    resources :books
    resources :reviews
    resources :comments
  end
end
