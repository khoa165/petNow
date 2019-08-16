Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/pets/search', to: 'pets#search'
  get '/bookings/booked', to: 'bookings#booked'
  get '/bookings/booking', to: 'bookings#booking'
  resources :pets do
    resources :bookings, only: [:create]
    get '/reviews/all', to: 'reviews#pet_reviews', as: 'pet_reviews'
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
    resources :reviews, only: [:index, :new, :create ]
  end
end
