Rails.application.routes.draw do
  devise_for :users
  root to: "instruments#index"

  resources :instruments, only: [:new, :create, :index, :show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
