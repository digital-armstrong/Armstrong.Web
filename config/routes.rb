Rails.application.routes.draw do

  root 'post#index'

  post 'device/download', to: 'device#download'

  namespace :api do
    namespace :v1,  defaults: {format: 'json'} do
      resources :filters, :armstrong, only: :index
    end
  end

  namespace :admin do
    get '', to: 'admin#index'
    resources :users
    resources :device do
      post :create_inspection, :to => 'device#create_inspection'
    end
    resources :device_model, :measurement_class
    resources :manufacturer, :measurement_group, :device_reg_group, :supplementary_kit, :device_component, except: [:show]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :home
  resources :armstrong, only: [:index, :show]
  resources :about, only: [:index]
  resources :device do
    post :create_inspection, :to => 'device#create_inspection'
  end

  resources :inspection do
    get :new_tasks, :to => 'inspection#new_tasks', :on => :collection
    get :my_tasks, :to => 'inspection#my_tasks', :on => :collection
    get :completed_tasks, :to => 'inspection#completed_tasks', :on => :collection
    get :all_tasks, :to => 'inspection#all_tasks', :on => :collection
    post :accept_task, :to => 'inspection#accept_task', :on => :member
    post :complete_verification, :to => 'inspection#complete_verification', :on => :member
    post :fail_verification, :to => 'inspection#fail_verification', :on => :member
    post :close, :to => 'inspection#close', :on => :member
    post :send_to_repair, :to => 'inspection#send_to_repair', :on => :member
    post :return_from_repair, :to => 'inspection#return_from_repair', :on => :member
  end

  resources :post
  get :armstrong, to: 'controllers#react'

end
