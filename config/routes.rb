Rails.application.routes.draw do
  get "profiles/new"
  get "profiles/create"
  get "profiles/edit"
  get "profiles/update"
  
  resources :users
  resources :tweets
  resources :likes
  resources :profiles

  post 'top/login'
  get 'top/logout'

  root 'top#main'

  get "up" => "rails/health#show", as: :rails_health_check
end