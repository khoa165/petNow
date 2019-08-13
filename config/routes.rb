Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pets do
    resources :bookings, only: [:create]
    resources :reviews, only: [:pet_reviews]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:index, :show, :edit, :update, :destroy]
end
