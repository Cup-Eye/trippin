Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trips, except: :index
  resource :dashboard, only: [:show, :destroy], controller: "dashboard"

  resources :accommodation_board, only: [] do
    resources :comments, only: :create
    resources :accommodations, only: [:new, :create, :index]
  end

  resources :destination_board, only: [] do
    resources :comments, only: :create
    resources :destinations, only: [:new, :create, :index]
  end

  resources :timeframe_board, only: [] do
    resources :comments, only: :create
    resources :timeframes, only: [:new, :create, :index]
  end

  resources :transportation_board, only: [] do
    resources :comments, only: :create
    resources :transportations, only: [:new, :create, :index]
  end

  resources :destinations, only: [:edit, :update, :destroy]
  resources :accommodations, only: [:show, :edit, :update, :destroy]
  resources :timeframes, only: [:edit, :update, :destroy]
  resources :transportations, only: [:edit, :update, :destroy]


end
