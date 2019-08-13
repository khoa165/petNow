Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pets do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
end
