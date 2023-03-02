Rails.application.routes.draw do
  root 'home#index'

  resources :home
  resources :armstrong, only: [:index, :show]
  resources :about, only: [:index]
  resources :device
end
