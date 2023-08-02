Rails.application.routes.draw do
  root "pages#home"
  devise_for :users
  resources :castles do
    resources :rentals, only: %i[new create]
  end
  resources :rentals, only: %i[index destroy]
  get "search", to: 'pages#search'
  get "earnings", to: 'castles#earnings'
end
