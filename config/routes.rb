Rails.application.routes.draw do
  root "users#check_login"
  get "/login", to: "users#check_login"
  post "/login", to: "users#login"
  get "/logout", to: "users#logout"

  
  resources :users
  resources :events do
    member do
      get 'participate'
    end
  end
  # resources :registrations, only: [ :participate ]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
