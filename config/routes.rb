Rails.application.routes.draw do
  root 'application#hello'
  resources :memos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
