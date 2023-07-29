Rails.application.routes.draw do
  root "castles#index"
  devise_for :users
  resources :castles, except: :index do
    resources :rentals, only: [:new, :create]
  end
  resources :rentals, only: [:index, :show, :destroy]
end
