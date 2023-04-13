Rails.application.routes.draw do
  root 'home#index'

  post 'device/download', to: 'device#download'

  namespace :api do
    namespace :v1,  defaults: {format: 'json'} do
      resources :filters, only: :index
    end
  end

  resources :home
  resources :armstrong, only: [:index, :show]
  resources :about, only: [:index]
  resources :device, :device_model, :measurement_class,  :device_component, :inspection
  resources :manufacturer, :measurement_group, :device_reg_group, :supplementary_kit, except: [:show]
  resources :post

end
