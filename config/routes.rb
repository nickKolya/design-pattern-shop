Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :items
  resources :orders, only: [] do
    collection do
      get :show_to_pay
    end
  end
  resources :payments, only: [:create]
end
