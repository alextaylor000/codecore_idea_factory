Rails.application.routes.draw do
  root "ideas#index"
  get "/signup" => "users#new"
  get "/login"  => "sessions#new"
  delete "/logout" => "sessions#destroy"

  resources :sessions, only: [:create]
  resources :users
  resources :ideas do
    resources :comments, only: [:create]
    # TODO: refactor the idea routes, they read ugly
    resources :idea_members, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
end
