Rails.application.routes.draw do
  root 'home#index'

  post 'device/download', to: 'device#download'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :home
  resources :armstrong, only: [:index, :show]
  resources :about, only: [:index]
  resources :device
  resources :device_model
  resources :post
  resources :users, only: [:new, :create]
end
