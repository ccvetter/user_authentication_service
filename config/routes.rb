Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate_request'

  resources :users
end
