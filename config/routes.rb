Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "castles#index"
  devise_for :users
  resources :castles, except: :index
  resources :rentals, only: [:index, :show ]
end
