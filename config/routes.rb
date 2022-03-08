Rails.application.routes.draw do
  namespace :api do
    resources :abouts
    post 'authenticate', to: 'authentication#authenticate'
  end
end
