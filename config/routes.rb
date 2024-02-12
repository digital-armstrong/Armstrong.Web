Rails.application.routes.draw do
  mount Sidekiq::Web => '/admin/sidekiq'

  root 'post#index'

  post 'device/download', to: 'device#download'
  get '/licenses/:locale', to: 'licenses#show', as: 'license'

  namespace :api do
    namespace :v1,  defaults: {format: 'json'} do
      resources :filters, :armstrong, only: :index
      resources :histories, only: :show
    end
  end

  namespace :admin do
    get '', to: 'admin#index'
    resources :users
    resources :device do
      post :create_inspection, :to => 'device#create_inspection'
    end
    resources :device_model, :measurement_class
    resources :room, :building, :organization, :division, :service, :control_point, :manufacturer, :measurement_group, :device_reg_group,
              :supplementary_kit, :device_component, except: [:show]
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :home
  resources :armstrong, only: [:index, :show]
  resources :device do
    post :create_inspection, :to => 'device#create_inspection'
  end
  resources :room, :building, :organization, :division, :service, :control_point, :device_model, :measurement_class,
   :manufacturer, :measurement_group, :device_reg_group, :supplementary_kit, :device_component, only: [:create, :new]

  resources :inspection, except: [:index] do
    get :new_tasks, :to => 'inspection#new_tasks', :on => :collection
    get :my_tasks, :to => 'inspection#my_tasks', :on => :collection
    get :completed_tasks, :to => 'inspection#completed_tasks', :on => :collection
    get :all_tasks, :to => 'inspection#all_tasks', :on => :collection
    get :service_tasks, :to => 'inspection#service_tasks', :on => :collection
    post :accept_task, :to => 'inspection#accept_task', :on => :member
    post :complete_verification, :to => 'inspection#complete_verification', :on => :member
    post :fail_verification, :to => 'inspection#fail_verification', :on => :member
    post :close, :to => 'inspection#close', :on => :member
    post :send_to_repair, :to => 'inspection#send_to_repair', :on => :member
    post :return_from_repair, :to => 'inspection#return_from_repair', :on => :member
    post :send_from_repair_to_verification, :to => 'inspection#send_from_repair_to_verification', :on => :member
    post :send_from_repair_to_close, :to => 'inspection#send_from_repair_to_close', :on => :member
  end

  resources :post
  get :armstrong, to: 'controllers#react'

end
