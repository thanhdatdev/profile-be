Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :abouts
    end

    post 'authenticate', to: 'authentication#authenticate'
  end
end
