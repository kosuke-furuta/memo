Rails.application.routes.draw do

  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :taskmemos
  resources :account_activations, only: [:edit]

  get 'print', to: 'work_process#print'
  get '/drylaminate', to: 'work_process#drylaminate'
  get '/exlaminate', to: 'work_process#exlaminate'
  get '/slit', to: 'work_process#slit'
  get '/bagmake', to: 'work_process#bagmake'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
