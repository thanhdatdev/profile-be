Rails.application.routes.draw do
  namespace :api do
    resources :about_mes
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#login"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
