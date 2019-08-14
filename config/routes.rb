Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pets do
    member do                             # member => restaurant id in URL
      get '/search', to 'pets#search'                         # RestaurantsController#chef
    end

    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy] do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:index, :show, :edit, :update, :destroy]
end
