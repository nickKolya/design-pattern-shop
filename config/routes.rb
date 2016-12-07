Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  resources :items do
    get 'add_to_order', to: 'orders#add_to_order', as: 'add_to_order'
  end

  resources :orders, except: [:show] do
    member do
      get 'cancel', to: 'orders#cancel', as: 'cancel'
      get 'reopen', to: 'orders#reopen', as: 'reopen'
      get 'invoice', to: 'orders#invoice', as: 'invoice'
      get 'clone', to: 'orders#clone', as: 'clone'
      get 'copy', to: 'orders#copy', as: 'copy'
    end
  end

  resources :products

  resources :services
end
