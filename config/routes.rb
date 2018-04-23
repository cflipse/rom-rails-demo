# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match "auth/:provider/callback", to: "sessions#create", via: %i[get post]
  get "/login", to: "sessions#new", as: :login
  get "/logout", to: "sessions#destroy", as: :logout

  get "/", to: "home#index"

  resource :admin, controller: "admin"
end
