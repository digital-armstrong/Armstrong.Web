Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  post 'device/download', to: 'device#download'

  resources :home
  resources :armstrong, only: [:index, :show]
  resources :about, only: [:index]
  resources :device, :device_model, :measurement_class
  resources :manufacturer, :measurement_group, :device_reg_group, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :post

end
