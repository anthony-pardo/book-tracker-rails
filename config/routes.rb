Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'registrations',
        omniauth_callbacks: 'users/omniauth_callbacks'
      }
  
  devise_scope :user do 
    get 'log_in', to: 'devise/sessions#new'
  end
  devise_scope :user do 
    get 'sign_up', to: 'devise/registrations#new'
  end
  devise_scope :user do 
    get 'sign_out', to: 'devise/sessions#destroy'
  end
  
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
    
  resources :users do
    resources :books
    resources :reviews
    resources :comments
  end
  get 'users/most_books', to: 'users#most_books', as: 'user_most_books'
  
  resources :books do 
    resources :reviews 
  end
  resources :reviews

end
