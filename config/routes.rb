Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :items
  resources :orders, except: [:show]
end
