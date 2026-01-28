Rails.application.routes.draw do
  devise_for :users
  root to: redirect("/users/sign_in")
  # devise_for :users, controllers: {
  #   registrations: "users/registrations"
  # }

  
  get "up" => "rails/health#show", as: :rails_health_check

  resources :tasks
  get "dashboard", to: "dashboard#index", as: :dashboard
  resources :user_management
end
