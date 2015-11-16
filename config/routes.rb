Rails.application.routes.draw do
  root "sessions#new"

  resources :users
  resources :sessions, only: [:create]

  get "/signup" => "users#new"
  get "/login"  => "sessions#new"
  delete "/logout" => "sessions#destroy"
end
