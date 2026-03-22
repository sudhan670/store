Rails.application.routes.draw do
  root "welcome#index"

  get  "/signup",  to: "users#new",        as: :signup
  post "/signup",  to: "users#create"

  get  "/login",   to: "sessions#new",     as: :login
  post "/login",   to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  get  "/admin",   to: "pages#admin",      as: :admin
  get  "/user",    to: "pages#user",       as: :user

  resources :polls, only: [:new, :create]
  resources :votes, only: [:create]
end