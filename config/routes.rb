Rails.application.routes.draw do
  get 'bookings/new'
  devise_for :users
  root to: "instruments#index"

  resources :instruments, only: [:new, :create, :index, :show, :destroy] do
    resources :bookings, only: [:new, :create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
