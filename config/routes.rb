Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trips do
    resources :destinations
    resources :accommodations
    resources :timeframes
    resources :transportations
    resources :boards, only: [:index]
  end

end
