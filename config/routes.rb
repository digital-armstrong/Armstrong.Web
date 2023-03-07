Rails.application.routes.draw do
  root 'home#index'

  post 'device/download', to: 'device#download'

  resources :home
  resources :armstrong, only: [:index, :show]
  resources :about, only: [:index]
  resources :device
  resources :device_model
  resources :post
end
