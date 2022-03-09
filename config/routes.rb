Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :abouts
    end

    post 'authenticate', to: 'authentication#authenticate'
    post 'get_refresh_token', to: 'authentication#get_refresh_token'
  end

  root to: "application#cookie"
end
