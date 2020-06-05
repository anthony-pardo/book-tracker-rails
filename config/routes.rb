Rails.application.routes.draw do
  resources :genres
  devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
    
  resources :users do
    resources :genres
    resources :books
    resources :reviews
    resources :comments
  end

  # omniauth routes
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
end
