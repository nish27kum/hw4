Rails.application.routes.draw do

  get "/", to: "places#index"

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :entries
  resources :places
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end

