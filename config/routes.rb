Rails.application.routes.draw do
  resources :users
  resources :tweets
  resources :likes

  post 'top/login'
  get 'top/logout'

  root 'top#main'

  get "up" => "rails/health#show", as: :rails_health_check
end