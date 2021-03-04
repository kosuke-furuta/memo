Rails.application.routes.draw do

  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users

  resources :taskmemos do
    member do
      get :following, :followers
    end
  end

  resources :taskmemos, only: [:create, :destroy]
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :relationships, only: [:create, :destroy]

  get 'print', to: 'work_process#print'
  get '/drylaminate', to: 'work_process#drylaminate'
  get '/exlaminate', to: 'work_process#exlaminate'
  get '/slit', to: 'work_process#slit'
  get '/bagmake', to: 'work_process#bagmake'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
