Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  #root to: 'pages#dashboard'
  get 'dashboard', to: 'pages#dashboard'
  resources :users
  resources :loutres do
    resources :locations, only: %i[new create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
