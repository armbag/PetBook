Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pets, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:new, :create, :index, :show]
  end
  resources :bookings, only: [:destroy]
end
