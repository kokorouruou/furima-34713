Rails.application.routes.draw do
  devise_for :users
  #get 'items', to: 'items#index'
  root to: 'items#index'
  resources :items, only: [:index, :new, :create]
  #resources :purchases, only: [:create]
end