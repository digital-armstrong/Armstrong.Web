Rails.application.routes.draw do

  root 'post#index'

  post 'device/download', to: 'device#download'

  namespace :api do
    namespace :v1,  defaults: {format: 'json'} do
      resources :filters, only: :index
    end
  end

  namespace :admin do
    get '', to: 'admin#index'
    resources :users
    resources :device, :device_model, :measurement_class
    resources :manufacturer, :measurement_group, :device_reg_group, :supplementary_kit, :device_component, except: [:show]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :home
  resources :armstrong, only: [:index, :show]
  resources :about, only: [:index]
  resources :device, :inspection
  resources :post

end
