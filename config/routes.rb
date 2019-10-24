Rails.application.routes.draw do
  get 'profile',to: 'users#profile',as: :profile
  devise_for :users
  resources :products
  resources :orders,only: %i[index]
  root 'products#index'
  post 'products/:id/create_session',to: 'orders#create_session',as: :checkout
  post 'stripe_webhook',to: 'orders#stripe_webhook'
end
