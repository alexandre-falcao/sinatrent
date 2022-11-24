Rails.application.routes.draw do
  get 'bookings/new'
  devise_for :users
  root to: "instruments#index"

  resources :instruments, only: [:new, :create, :index, :show] do
    resources :bookings, only: [:new, :create]
  end
  delete "instruments/:id", to: "instruments#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
